// To parse this JSON data, do
//
//     final sectionModel = sectionModelFromJson(jsonString);

import 'dart:convert';

List<SectionModel> sectionModelFromJson(String str) => List<SectionModel>.from(json.decode(str).map((x) => SectionModel.fromJson(x)));

String sectionModelToJson(List<SectionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SectionModel {
    SectionModel({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
