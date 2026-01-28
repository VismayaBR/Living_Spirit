// To parse this JSON data, do
//
//     final branchListModel = branchListModelFromJson(jsonString);

import 'dart:convert';

import 'package:livingspirit/domain/entities/branch_entity.dart';

BranchListModel branchListModelFromJson(String str) =>
    BranchListModel.fromJson(json.decode(str));

String branchListModelToJson(BranchListModel data) =>
    json.encode(data.toJson());

class BranchListModel {
  final bool success;
  final List<Datum> data;
  final String message;

  BranchListModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory BranchListModel.fromJson(Map<String, dynamic> json) =>
      BranchListModel(
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

class Datum extends BranchEntity {
  final String id;
  final String name;
  final String code;
  final String location;
  final String mobile;

  const Datum({
    required this.id,
    required this.name,
    required this.code,
    required this.location,
    required this.mobile,
  }) : super(
         branchId: id,
         branchName: name,
         branchLocation: location,
         phone: mobile,
       );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"].toString(),
    name: json["name"],
    code: json["code"],
    location: json["location"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "location": location,
    "mobile": mobile,
  };
}
