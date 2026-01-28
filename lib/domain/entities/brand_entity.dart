import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BrandEntity extends Equatable {
  final String brandId;
  final String brandName;
  final String? brandImage;
  bool isSelect;

  BrandEntity(
      {required this.brandId,
      required this.brandName,
      this.brandImage,
    
      this.isSelect = false});

  @override
  List<Object?> get props => [];
}
