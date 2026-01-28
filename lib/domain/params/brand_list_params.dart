import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BrandListParams extends Equatable {
  String? size;

  BrandListParams({this.size});

  Map<String, dynamic> toMap() {
    return {"size": size,
   };
  }

  @override
  List<Object?> get props => [];
}
