import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TypeEntity extends Equatable {
  final String from;
  final bool isEnglish;
  final String? size;
  final String? mainCategory;
  final String? branch;
  final String? categoryName;

  const TypeEntity({
    required this.from,
    required this.isEnglish,
    this.size,
    this.mainCategory,
    this.branch,
    this.categoryName,
  });

  @override
  List<Object?> get props => [];
}
