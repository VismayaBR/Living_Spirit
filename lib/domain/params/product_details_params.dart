import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductDetailsParams extends Equatable {
  String? id;

  ProductDetailsParams({this.id});

  Map<String, dynamic> toMap() {
    return {"product": id};
  }

  @override
  List<Object?> get props => [];
}
