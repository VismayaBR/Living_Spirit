

// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

import 'package:livingspirit/domain/entities/product_entity.dart';

ProductListModel productListModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) =>
    json.encode(data.toJson());

class ProductListModel {
  final bool success;
  final Data data;
  final String message;

  ProductListModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
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

class Data {
  final List<Datum>   data;
  final Pagination pagination;

  Data({
    required this.data,
    required this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class Datum extends ProductEntity {
  final String id;
  final String code;
  final String name;
  final String nameArabic;
  final dynamic description;
  final String thumbnail;
  final String? size;
  final String mrp;
  final Brand? brand;
  final Brand mainCategory;
  final dynamic subCategory;
  final List<Inventory> inventories;
  final String totalStock;
  final bool isLowStock;
  final bool isOutOfStock;

  const Datum({
    required this.id,
    required this.code,
    required this.name,
    required this.nameArabic,
    required this.description,
    required this.thumbnail,
    required this.size,
    required this.mrp,
    required this.brand,
    required this.mainCategory,
    required this.subCategory,
    required this.inventories,
    required this.totalStock,
    required this.isLowStock,
    required this.isOutOfStock,
  }) : super(productId: id, productName: name, productPrice: mrp,
  productImage:thumbnail,productArabicName: nameArabic);

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"].toString(),
    code: json["code"],
    name: json["name"],
    nameArabic: json["name_arabic"]??"",
    description: json["description"],
    thumbnail: json["thumbnail"]??"",
    size: json["size"],
    mrp: json["mrp"].toString(),
    brand: json["brand"] != null
      ? Brand.fromJson(json["brand"])
      : null,
    mainCategory: Brand.fromJson(json["main_category"]),
    subCategory: json["sub_category"],
    inventories: List<Inventory>.from(
      json["inventories"].map((x) => Inventory.fromJson(x)),
    ),
    totalStock: json["total_stock"].toString(),
    isLowStock: json["is_low_stock"],
    isOutOfStock: json["is_out_of_stock"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "name_arabic": nameArabic,
    "description": description,
    "thumbnail": thumbnail,
    "size": size,
    "mrp": mrp,
    "brand": brand?.toJson(),
    "main_category": mainCategory.toJson(),
    "sub_category": subCategory,
    "inventories": List<dynamic>.from(inventories.map((x) => x.toJson())),
    "total_stock": totalStock,
    "is_low_stock": isLowStock,
    "is_out_of_stock": isOutOfStock,
  };
}

class Brand {
  final String id;
  final String name;

  Brand({required this.id, required this.name});

  factory Brand.fromJson(Map<String, dynamic> json) =>
      Brand(id: json["id"].toString(), name: json["name"]??"");

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Inventory {
  final int id;
  final Brand branch;
  final String quantity;
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
    quantity: json["quantity"].toString(),
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

class Pagination {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final bool hasMorePages;

  Pagination({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.hasMorePages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    lastPage: json["last_page"],
    perPage: json["per_page"],
    total: json["total"],
    hasMorePages: json["has_more_pages"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "last_page": lastPage,
    "per_page": perPage,
    "total": total,
    "has_more_pages": hasMorePages,
  };
}