// To parse this JSON data, do
//
//     final brandListModel = brandListModelFromJson(jsonString);

import 'dart:convert';

import 'package:livingspirit/domain/entities/brand_entity.dart';

BrandListModel brandListModelFromJson(String str) =>
    BrandListModel.fromJson(json.decode(str));

String brandListModelToJson(BrandListModel data) => json.encode(data.toJson());

class BrandListModel {
  final bool success;
  final List<Datum> data;
  final String message;

  BrandListModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory BrandListModel.fromJson(Map<String, dynamic> json) => BrandListModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

// ignore: must_be_immutable
class Datum extends BrandEntity {
  final String id;
  final String name;
  final int productCount;
  final String imagePath;

  Datum({
    required this.id,
    required this.name,
    required this.productCount,
    required this.imagePath,
  }) : super(brandId: id, brandName: name, brandImage: imagePath,);

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"].toString(),
    name: json["name"],
    productCount: json["product_count"],
    imagePath:json["image_path"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "product_count": productCount,
    "image_path": imagePath,
  };
}
