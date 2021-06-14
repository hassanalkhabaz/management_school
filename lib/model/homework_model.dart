import 'dart:convert';

List<HomeworkModel> homeworkModelFromJson(String str) =>
    List<HomeworkModel>.from(
        json.decode(str).map((x) => HomeworkModel.fromJson(x)));

String homeworkModelToJson(List<HomeworkModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeworkModel {
  HomeworkModel({
    this.id,
    this.subName,
    this.description,
    this.createdOn,
    this.endDate,
  });

  int id;
  String subName;
  String description;
  DateTime createdOn;
  DateTime endDate;

  factory HomeworkModel.fromJson(Map<String, dynamic> json) => HomeworkModel(
        id: json["id"],
        subName: json["subName"],
        description: json["description"],
        createdOn: DateTime.parse(json["createdOn"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subName": subName,
        "description": description,
        "createdOn": createdOn.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      };
}
