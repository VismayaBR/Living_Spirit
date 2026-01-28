import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_360_viewer/image_360_viewer.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Product360View extends StatefulWidget {
  const Product360View({super.key});

  @override
  State<Product360View> createState() => _Product360ViewState();
}

class _Product360ViewState extends State<Product360View> {
  List<String> imageAssetList = Get.arguments;
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _preloadImages();
  }

  Future<void> _preloadImages() async {
    if (imageAssetList.isEmpty) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
          _errorMessage = 'No images available';
        });
      }
      return;
    }

    try {
      // Preload all images using CachedNetworkImage to populate cache
      for (int i = 0; i < imageAssetList.length; i++) {
        String imageUrl = imageAssetList[i];
        try {
          await precacheImage(
            CachedNetworkImageProvider(imageUrl),
            context,
          );
        } catch (e) {
          // Continue even if one image fails to preload
          debugPrint('Failed to preload image $i: $imageUrl - $e');
        }
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
          _errorMessage = 'Failed to load images. Please try again.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.keyboard_arrow_left_outlined, color: blackColor),
        ),
        titleSpacing: -(defaultPadding * .5),
        title: SizedBox(width: MediaQuery.of(context).size.width * .85),
      ),
      extendBodyBehindAppBar: true,
      body: _isLoading
          ? Container(
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitFadingCircle(
                      color: whiteColor,
                      size: 50.0,
                    ),
                    SizedBox(height: defaultPadding),
                    Text(
                      'Loading 360° view...',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: whiteColor,
                            fontSize: defaultPadding * .7,
                          ),
                    ),
                  ],
                ),
              ),
            )
          : _hasError
              ? Container(
                  color: Colors.black,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: whiteColor,
                          ),
                          SizedBox(height: defaultPadding),
                          Text(
                            _errorMessage ?? 'Failed to load images',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: whiteColor,
                                  fontSize: defaultPadding * .7,
                                ),
                          ),
                          SizedBox(height: defaultPadding * 1.5),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isLoading = true;
                                _hasError = false;
                                _errorMessage = null;
                              });
                              _preloadImages();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: whiteColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding * 1.5,
                                vertical: defaultPadding * .7,
                              ),
                            ),
                            child: Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Image360Viewer.networkList(
                    imageUrls: imageAssetList,
                    zoomEnabled: true,
                    gyroEnabled: true,
                    gyroSensitivity: 1.5, // Enhanced gyroscope responsiveness
                  ),
                ),
    );
  }
}
