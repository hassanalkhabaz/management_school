import 'dart:convert';

List<AlarmModel> alarmModelFromJson(String str) =>
    List<AlarmModel>.from(json.decode(str).map((x) => AlarmModel.fromJson(x)));

String alarmModelToJson(List<AlarmModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlarmModel {
  AlarmModel({
    this.id,
    this.alarmReason,
    this.userName,
    this.date,
  });

  int id;
  String alarmReason;
  String userName;
  DateTime date;

  factory AlarmModel.fromJson(Map<String, dynamic> json) => AlarmModel(
        id: json["id"],
        alarmReason: json["alarmReason"],
        userName: json["userName"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alarmReason": alarmReason,
        "userName": userName,
        "date": date.toIso8601String(),
      };
}
