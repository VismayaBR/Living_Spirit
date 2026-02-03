import 'package:equatable/equatable.dart';

class ProductDetailsArgs extends Equatable {
  final String? id;
  final String? branch;
  final bool isEnglish;
  final String? barcode;

  const ProductDetailsArgs({ this.id,required this.isEnglish,this.branch,this.barcode});

  @override
  List<Object?> get props => [];
}