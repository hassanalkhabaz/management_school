import 'dart:convert';

List<MarkModel> markModelFromJson(String str) =>
    List<MarkModel>.from(json.decode(str).map((x) => MarkModel.fromJson(x)));

String markModelToJson(List<MarkModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarkModel {
  MarkModel({
    this.subName,
    this.degree,
    this.markTypeName,
    this.subsemester,
    this.subYear,
    this.userName,
  });

  String subName;
  int degree;
  String markTypeName;
  int subsemester;
  int subYear;
  String userName;

  factory MarkModel.fromJson(Map<String, dynamic> json) => MarkModel(
        subName: json["subName"],
        degree: json["degree"],
        markTypeName: json["markTypeName"],
        subsemester: json["subsemester"],
        subYear: json["subYear"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "subName": subName,
        "degree": degree,
        "markTypeName": markTypeName,
        "subsemester": subsemester,
        "subYear": subYear,
        "userName": userName,
      };
}
