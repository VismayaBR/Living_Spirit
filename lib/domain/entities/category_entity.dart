import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CategoryListEntity extends Equatable {
  final String categories;

  const CategoryListEntity(
      {required this.categories,});

  @override
  List<Object?> get props => [];
}
