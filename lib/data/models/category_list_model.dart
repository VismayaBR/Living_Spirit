// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'package:livingspirit/domain/entities/category_entity.dart';
import 'dart:convert';

CategoryListModel categoryListModelFromJson(String str) => CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) => json.encode(data.toJson());

class CategoryListModel {
    final bool success;
    final List<Datum> data;
    final String message;

    CategoryListModel({
        required this.success,
        required this.data,
        required this.message,
    });

    factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
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

class Datum extends CategoryListEntity{
    final String id;
    final String name;

    const Datum({
        required this.id,
        required this.name,
    }) : super(categories: name, categoryId: id);

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"].toString(),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
