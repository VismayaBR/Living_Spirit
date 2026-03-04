import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CategoryListEntity extends Equatable {
  final String categories;
  final String categoryId;

  const CategoryListEntity(
      {required this.categories,required this.categoryId});

  @override
  List<Object?> get props => [];
}
