

import 'package:equatable/equatable.dart';

class ProductListArgs extends Equatable {
  final String brandId;
  final bool isEnglish;
  final String brandName;
  final String? size;
  final String? mainCategory;

  const ProductListArgs({
    required this.brandId,
    required this.isEnglish,
    required this.brandName,
    this.size,
    this.mainCategory,
  });

  @override
  List<Object?> get props => [];
}

