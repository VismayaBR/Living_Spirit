import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductListParams extends Equatable {
  String? id;
  String? brandId;
  String? branchId;
  String? size;
  String? color;
  String? mainCategoryId;
  String? maxPrice;
  int? perPage;
  int? page;
  bool? morePage;
  String? search;
  String? sortDirection;


  ProductListParams({
    this.id,
    this.brandId,
    this.branchId,
    this.size,
    this.color,
    this.mainCategoryId,
    this.maxPrice,
    this.perPage=16,
    this.page,
    this.morePage,
    this.search,
    this.sortDirection,
  });

  Map<String, dynamic> toMap() {
    return {
      "brand_id": brandId,
      "branch_id": branchId,
      "color": color,
      "main_category_id": mainCategoryId,
      "max_price": maxPrice,
      "per_page":perPage,
      "page":page,
      "size":size,
      "search":search,
      "sortDirection":sortDirection
    };
  }

  @override
  List<Object?> get props => [];
}
