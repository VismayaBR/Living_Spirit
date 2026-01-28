import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String imageUrl;
  final String imageId;
  final String? title;
  final String? description;

  const BannerEntity({
    required this.imageUrl,
    required this.imageId,
    this.title,
    this.description,
  });

  @override
  List<Object> get props => [imageUrl];
}
