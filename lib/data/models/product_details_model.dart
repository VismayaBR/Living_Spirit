// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:livingspirit/domain/entities/banner_entity.dart';
import 'package:livingspirit/domain/entities/product_entity.dart';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  final bool success;
  final Data data;
  final String message;

  ProductDetailsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

// ignore: must_be_immutable
class Data extends ProductEntity {
  final String id;
  final String code;
  final String name;
  final String nameArabic;
  final dynamic description;
  final dynamic thumbnail;
  final String barcode;
  final dynamic color;
  final String size;
  final dynamic model;
  final dynamic hsnCode;
  final String mrp;
  final dynamic location;
  final int priority;
  final int time;
  final String createdAt;
  final String updatedAt;
  final Unit unit;
  final Brand? brand;
  final Brand mainCategory;
  final dynamic subCategory;
  final List<Image>? images;
  final List<Image>? images360;
  final List<Inventory> inventories;
  final String totalStock;
  final bool isLowStock;
  final bool isOutOfStock;
  final List<String> availableSizes;
  List<RelatedSize> relatedSizes;
  final String stockQuantityAvailabilityStatus;

  Data({
    required this.id,
    required this.code,
    required this.name,
    required this.nameArabic,
    required this.description,
    required this.thumbnail,
    required this.barcode,
    required this.color,
    required this.size,
    required this.model,
    required this.hsnCode,
    required this.mrp,
    required this.location,
    required this.priority,
    required this.time,
    required this.createdAt,
    required this.updatedAt,
    required this.unit,
    required this.brand,
    required this.mainCategory,
    required this.subCategory,
    required this.images,
    required this.images360,
    required this.inventories,
    required this.totalStock,
    required this.isLowStock,
    required this.isOutOfStock,
    required this.availableSizes,
    required this.relatedSizes,
     required this.stockQuantityAvailabilityStatus,
  }) : super(
         productId: id,
         productName: name,
         productPrice: mrp,
         sizes: availableSizes,
         productImages: images,
         productArabicName: nameArabic,
         productStock: totalStock,
         // ignore: prefer_null_aware_operators
         productBrand: brand != null ? brand.name : null,
         productDescription: description,
         relatedSizeList: relatedSizes,
         quantityAvailabilityStatus: stockQuantityAvailabilityStatus
       );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"].toString(),
    code: json["code"],
    name: json["name"],
    nameArabic: json["name_arabic"] ?? "",
    description: json["description"],
    thumbnail: json["thumbnail"],
    barcode: json["barcode"],
    color: json["color"],
    size: json["size"] ?? "",
    model: json["model"],
    hsnCode: json["hsn_code"],
    mrp: json["mrp"].toString(),
    location: json["location"],
    priority: json["priority"],
    time: json["time"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    unit: Unit.fromJson(json["unit"]),
    brand: json["brand"] != null ? Brand.fromJson(json["brand"]) : null,
    mainCategory: Brand.fromJson(json["main_category"]),
    subCategory: json["sub_category"],
    images: json["images"] != null
        ? List<Image>.from(json["images"].map((x) => Image.fromJson(x)))
        : [],
    images360: json["images360"] != null
        ? List<Image>.from(json["images360"].map((x) => Image.fromJson(x)))
        : [],
    inventories: List<Inventory>.from(
      json["inventories"].map((x) => Inventory.fromJson(x)),
    ),
    totalStock: json["total_stock"] != null
        ? json["total_stock"].toString()
        : "0",
    isLowStock: json["is_low_stock"],
    isOutOfStock: json["is_out_of_stock"],
    availableSizes: json["available_sizes"] == null
        ? []
        : List<String>.from(json["available_sizes"]!.map((x) => x)),
    relatedSizes: List<RelatedSize>.from(
      json["related_sizes"].map((x) => RelatedSize.fromJson(x)),
    ),
     stockQuantityAvailabilityStatus: json["stock_quantity_availability_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "name_arabic": nameArabic,
    "description": description,
    "thumbnail": thumbnail,
    "barcode": barcode,
    "color": color,
    "size": size,
    "model": model,
    "hsn_code": hsnCode,
    "mrp": mrp,
    "location": location,
    "priority": priority,
    "time": time,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "unit": unit.toJson(),
    "brand": brand?.toJson(),
    "main_category": mainCategory.toJson(),
    "sub_category": subCategory,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "images360": List<dynamic>.from(images360!.map((x) => x.toJson())),
    "inventories": List<dynamic>.from(inventories.map((x) => x.toJson())),
    "total_stock": totalStock,
    "is_low_stock": isLowStock,
    "is_out_of_stock": isOutOfStock,
    "available_sizes": availableSizes == null
        ? []
        : List<dynamic>.from(availableSizes.map((x) => x)),
    "related_sizes": List<dynamic>.from(relatedSizes.map((x) => x.toJson())),
            "stock_quantity_availability_status": stockQuantityAvailabilityStatus,
  };
}

class Brand {
  final String id;
  final String name;

  Brand({required this.id, required this.name});

  factory Brand.fromJson(Map<String, dynamic> json) =>
      Brand(id: json["id"].toString(), name: json["name"] ?? "");

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class RelatedSize {
  String size;
  int totalStock;
  bool isOutOfStock;
  List<Branch> branches;

  RelatedSize({
    required this.size,
    required this.totalStock,
    required this.isOutOfStock,
    required this.branches,
  });

  factory RelatedSize.fromJson(Map<String, dynamic> json) => RelatedSize(
    size: json["size"].toString(),
    totalStock: json["total_stock"],
    isOutOfStock: json["is_out_of_stock"],
    branches: List<Branch>.from(
      json["branches"].map((x) => Branch.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "total_stock": totalStock,
    "is_out_of_stock": isOutOfStock,
    "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
  };
}

class Branch {
  int id;
  String name;
  int quantity;

  Branch({required this.id, required this.name, required this.quantity});

  factory Branch.fromJson(Map<String, dynamic> json) =>
      Branch(id: json["id"], name: json["name"], quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "quantity": quantity,
  };
}

class Inventory {
  final int id;
  final Brand branch;
  final int quantity;
  final bool isLowStock;
  final bool isOutOfStock;

  Inventory({
    required this.id,
    required this.branch,
    required this.quantity,
    required this.isLowStock,
    required this.isOutOfStock,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
    id: json["id"],
    branch: Brand.fromJson(json["branch"]),
    quantity: json["quantity"],
    isLowStock: json["is_low_stock"],
    isOutOfStock: json["is_out_of_stock"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "branch": branch.toJson(),
    "quantity": quantity,
    "is_low_stock": isLowStock,
    "is_out_of_stock": isOutOfStock,
  };
}

class Unit {
  final int id;
  final String name;
  final String code;

  Unit({required this.id, required this.name, required this.code});

  factory Unit.fromJson(Map<String, dynamic> json) =>
      Unit(id: json["id"], name: json["name"], code: json["code"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "code": code};
}

class Image extends BannerEntity {
  final String id;
  final String url;
  final String name;

  const Image({required this.id, required this.url, required this.name})
    : super(imageUrl: url, imageId: id);

  factory Image.fromJson(Map<String, dynamic> json) =>
      Image(id: json["id"].toString(), url: json["url"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "url": url, "name": name};
}