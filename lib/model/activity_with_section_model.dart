// To parse this JSON data, do
//
//     final activityWithSectionModel = activityWithSectionModelFromJson(jsonString);

import 'dart:convert';

List<ActivityWithSectionModel> activityWithSectionModelFromJson(String str) =>
    List<ActivityWithSectionModel>.from(
        json.decode(str).map((x) => ActivityWithSectionModel.fromJson(x)));

String activityWithSectionModelToJson(List<ActivityWithSectionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityWithSectionModel {
  ActivityWithSectionModel({
    this.id,
    this.sectionName,
    this.actVacDescription,
  });

  int id;
  String sectionName;
  String actVacDescription;

  factory ActivityWithSectionModel.fromJson(Map<String, dynamic> json) =>
      ActivityWithSectionModel(
        id: json["id"],
        sectionName: json["sectionName"],
        actVacDescription: json["actVacDescription"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sectionName": sectionName,
        "actVacDescription": actVacDescription,
      };
}
