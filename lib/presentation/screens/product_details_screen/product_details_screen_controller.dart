
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/entities/banner_entity.dart';
import 'package:livingspirit/domain/entities/product_entity.dart';
import 'package:livingspirit/domain/params/product_details_args.dart';
import 'package:livingspirit/domain/params/product_details_params.dart';
import 'package:livingspirit/domain/usecases/product_details_usecase.dart';

class ProductDetailsScreenController extends ChangeNotifier {
  ProductDetailsArgs args = Get.arguments;
  ProductDetailsUseCase productDetailsUseCase = Get.find();
  List<BannerEntity> productBanner = [];
  ProductEntity? productData;
  List<String> image_360s = [];
  int? selectedCategoryIndex;

  selectCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners(); 
  }

  

  // ProductListScreenController productListScreenController = Get.find();

  Timer? apiTimer;
  static const Duration refreshInterval = Duration(minutes: 2);

  AppError? appError;
  bool isLoading = true;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    getData();
  }

  @override
  void dispose() {
    stopPeriodicApiCalls();
    super.dispose();
  }

  loadData() async {
    getData();
    startPeriodicApiCalls();
  }

List<String> get availableBranches {
  if (productData?.relatedSizeList == null) return [];

  // If size selected → show ONLY branches with quantity != 0
  if (selectedCategoryIndex != null) {
    final branches =
        productData!.relatedSizeList![selectedCategoryIndex!].branches;

    return branches
        .where((b) => b.quantity != 0)
        .map((b) => b.name)
        .toList();
  }

  // If no size selected → show all branches with quantity == 0
  final branchNames = <String>{};

  for (final size in productData!.relatedSizeList!) {
    for (final branch in size.branches) {
      if (branch.quantity != 0) {
        branchNames.add(branch.name);
      }
    }
  }

  return branchNames.toList();
}




  // getData() async {
  //   appError = null;

  //   final response = await productDetailsUseCase(
  //     ProductDetailsParams(id: args.id),
  //   );

  //   response.fold(
  //     (l) {
  //       appError = l;
  //     },
  //     (r) {
  //       if (r.success) {
  //         productData = r.data;

  //         // consoleLog("related : ${productData!.relatedSizeList![0].size}");

  //         if (r.data.images360!.isNotEmpty) {
  //           image_360s = r.data.images360!.map((e) => e.url).toList();
  //           // Preload 360 images in the background for faster loading
  //           _preload360Images(image_360s);
  //         }

  //         if (r.data.images!.isNotEmpty) {
  //           productBanner = r.data.images!;
  //         }

  //         if (r.data.totalStock == "0") {
  //           productListScreenController.getData();
  //         }
  //       }
  //     },
  //   );

  //   makeNotLoading();
  // }

  getData() async {
  appError = null;
  // ProductListScreenController productListScreenController = Get.find();

  final int? previousSelectedIndex = selectedCategoryIndex;

  final response = await productDetailsUseCase(
    args.barcode!=null?
    ProductDetailsParams(barcode: args.barcode):
    ProductDetailsParams(id: args.id),
  );

  response.fold(
    (l) {
      appError = l;
    },
    (r) {
      if (r.success) {
        productData = r.data;

        // ✅ Restore selected size if still valid
        if (previousSelectedIndex != null &&
            productData!.relatedSizeList != null &&
            previousSelectedIndex <
                productData!.relatedSizeList!.length) {
          selectedCategoryIndex = previousSelectedIndex;
        }

        if (r.data.images360!.isNotEmpty) {
          image_360s = r.data.images360!.map((e) => e.url).toList();
          _preload360Images(image_360s);
        }

        if (r.data.images!.isNotEmpty) {
          productBanner = r.data.images!;
        }

        // if (r.data.totalStock == "0") {
        //   productListScreenController.getData();
        // }
      }
    },
  );

  makeNotLoading();
}


  void startPeriodicApiCalls() {
    stopPeriodicApiCalls();

    // Start new timer that calls API every 2 minutes
    apiTimer = Timer.periodic(refreshInterval, (timer) {
      if (!isLoading) {
        getData();
      }
    });
  }

  void stopPeriodicApiCalls() {
    apiTimer?.cancel();
    apiTimer = null;
  }

  /// Preload 360 images in the background to improve loading performance
  Future<void> _preload360Images(List<String> imageUrls) async {
    if (imageUrls.isEmpty) return;

    // Preload images in the background without blocking UI
    // Use a try-catch to prevent errors from affecting the main flow
    try {
      final context = Get.context;
      if (context == null) return;

      for (String imageUrl in imageUrls) {
        try {
          await precacheImage(
            CachedNetworkImageProvider(imageUrl),
            context,
          );
        } catch (e) {
          // Silently continue if preload fails for individual images
          if (kDebugMode) {
            debugPrint('Failed to preload 360 image: $imageUrl - $e');
          }
        }
      }
    } catch (e) {
      // Silently fail - preloading is optional
      if (kDebugMode) {
        debugPrint('Error preloading 360 images: $e');
      }
    }
  }

BranchAvailabilityStatus get branchAvailabilityStatus {
  if (selectedCategoryIndex == null || productData == null) {
    return BranchAvailabilityStatus.notAvailable;
  }

  final branches =
      productData!.relatedSizeList![selectedCategoryIndex!].branches;

  final hasAnyStock = branches.any((b) {
    final qty = int.tryParse(b.quantity.toString()) ?? 0;
    return qty > 0;
  });

  if (!hasAnyStock) {
    return BranchAvailabilityStatus.notAvailable;
  }

  // ✅ Check stock in current branch
  // ignore: unused_local_variable
  final hasInCurrentBranch = branches.any((b) {
    final qty = int.tryParse(b.quantity.toString()) ?? 0;
    return b.id.toString() == args.branch && qty > 0;
  });

  // if (hasInCurrentBranch) {
  //   return BranchAvailabilityStatus.availableHere;
  // }

  // ✅ Check stock in other branches
  final hasOtherBranchStock = branches.any((b) {
    final qty = int.tryParse(b.quantity.toString()) ?? 0;
    return b.id.toString() != args.branch && qty > 0;
  });

  if (hasOtherBranchStock) {
    return BranchAvailabilityStatus.availableOtherBranches;
  }

  return BranchAvailabilityStatus.notAvailable;
}


List<String> get otherAvailableBranchNames {
  if (selectedCategoryIndex == null || productData == null) return [];

  return productData!
      .relatedSizeList![selectedCategoryIndex!]
      .branches
      .where((b) {
        final qty = int.tryParse(b.quantity.toString()) ?? 0;
        return b.id.toString() != args.branch && qty > 0;
      })
      .map((b) => b.name)
      .toList();
}


  
}
enum BranchAvailabilityStatus {
  // availableHere,
  availableOtherBranches,
  notAvailable,
}