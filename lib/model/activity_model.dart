
import 'dart:convert';

List<ActivityModel> activityModelFromJson(String str) => List<ActivityModel>.from(json.decode(str).map((x) => ActivityModel.fromJson(x)));

String activityModelToJson(List<ActivityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityModel {
    ActivityModel({
        this.id,
        this.description,
        this.startDate,
        this.endDate,
        this.typeOf,
    });

    int id;
    String description;
    DateTime startDate;
    DateTime endDate;
    String typeOf;

    factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json["id"],
        description: json["description"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        typeOf: json["typeOf"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "typeOf": typeOf,
    };
}
