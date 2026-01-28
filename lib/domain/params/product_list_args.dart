import 'package:equatable/equatable.dart';

class ProductListArgs extends Equatable {
  final String brandId;
  final bool isEnglish;
  final String brandName;
  final String size;

  const ProductListArgs({
    required this.brandId,
    required this.isEnglish,
    required this.brandName,
    required this.size,
  });

  @override
  List<Object?> get props => [];
}
