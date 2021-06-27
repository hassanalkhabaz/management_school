// To parse this JSON data, do
//
//     final programeModel = programeModelFromJson(jsonString);

import 'dart:convert';

List<ProgrameModel> programeModelFromJson(String str) =>
    List<ProgrameModel>.from(
        json.decode(str).map((x) => ProgrameModel.fromJson(x)));

String programeModelToJson(List<ProgrameModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgrameModel {
  ProgrameModel({
    this.id,
    this.name,
    this.img,
  });

  int id;
  String name;
  String img;

  factory ProgrameModel.fromJson(Map<String, dynamic> json) => ProgrameModel(
        id: json["id"],
        name: json["name"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
      };
}
