
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductDetailsParams extends Equatable {
  String? id;
  String? barcode;

  ProductDetailsParams({this.id,this.barcode});

  Map<String, dynamic> toMap() {
    return {"product": id,"barcode": barcode,
    };
  }

  @override
  List<Object?> get props => [];
}

