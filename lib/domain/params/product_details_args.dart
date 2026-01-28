import 'package:equatable/equatable.dart';

class ProductDetailsArgs extends Equatable {
  final String id;
  final String? branch;
  final bool isEnglish;

  const ProductDetailsArgs({required this.id,required this.isEnglish,this.branch});

  @override
  List<Object?> get props => [];
}
