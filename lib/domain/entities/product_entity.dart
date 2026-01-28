import 'package:equatable/equatable.dart';
import 'package:livingspirit/data/models/product_details_model.dart';
import 'package:livingspirit/domain/entities/banner_entity.dart';

class ProductEntity extends Equatable {
  final String productId;
  final String productName;
  final String productArabicName;
  final String productPrice;
  final String? productType;
  final String? productCutPrice;
  final String? productImage;
  final String? productOffer;
  final String? productConfigType;
  final bool stockStatus;
  final bool isIncart;
  final bool isInWishlist;
  final List<String>? sizes;
  final List<BannerEntity>? productImages;
  final String? productStock; 
  final String? productBrand; 
  final String? productDescription; 
final List<RelatedSize>? relatedSizeList;
final String? quantityAvailabilityStatus;
final String? branch;

  const ProductEntity({
    required this.productId,
    required this.productName,
    required this.productArabicName,
    required this.productPrice,
    this.productType,
    this.productCutPrice,
    this.productImage,
    this.productOffer,
    this.productConfigType,
    this.stockStatus = false,
    this.isIncart = false,
    this.isInWishlist = false,
    this.sizes,
    this.productImages,
    this.productStock,
    this.productBrand,
    this.productDescription,
    this.relatedSizeList,
    this.quantityAvailabilityStatus,
    this.branch
  });

  @override
  List<Object?> get props => [productId, productName];
}
