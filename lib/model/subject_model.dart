import 'dart:convert';

List<SubjectModel> subjectModelFromJson(String str) => List<SubjectModel>.from(json.decode(str).map((x) => SubjectModel.fromJson(x)));

String subjectModelToJson(List<SubjectModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectModel {
    SubjectModel({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}