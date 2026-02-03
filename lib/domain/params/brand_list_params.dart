
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BrandListParams extends Equatable {
  String? size;
  String? mainCategory;

  BrandListParams({this.size,this.mainCategory});

  Map<String, dynamic> toMap() {
    return {"size": size,"main_category": mainCategory,
   };
  }

  @override
  List<Object?> get props => [];
}
