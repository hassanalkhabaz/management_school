// To parse this JSON data, do
//
//     final classModel = classModelFromJson(jsonString);

import 'dart:convert';

List<ClassModel> classModelFromJson(String str) =>
    List<ClassModel>.from(json.decode(str).map((x) => ClassModel.fromJson(x)));

String classModelToJson(List<ClassModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassModel {
  ClassModel({
    this.id,
    this.name,
    this.totalFees,
  });

  int id;
  String name;
  int totalFees;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        id: json["id"],
        name: json["name"],
        totalFees: json["totalFees"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "totalFees": totalFees,
      };
}
