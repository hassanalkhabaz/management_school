// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

List<AttendanceModel> attendanceModelFromJson(String str) =>
    List<AttendanceModel>.from(
        json.decode(str).map((x) => AttendanceModel.fromJson(x)));

String attendanceModelToJson(List<AttendanceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceModel {
  AttendanceModel({
    this.id,
    this.isPresense,
    this.date,
  });

  int id;
  int isPresense;
  DateTime date;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        id: json["id"],
        isPresense: json["isPresense"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isPresense": isPresense,
        "date": date.toIso8601String(),
      };
}
