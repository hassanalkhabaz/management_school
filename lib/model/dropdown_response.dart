// To parse this JSON data, do
//
//     final dropDownResponse = dropDownResponseFromJson(jsonString);

import 'dart:convert';

DropDownResponse dropDownResponseFromJson(String str) =>
    DropDownResponse.fromJson(json.decode(str));

String dropDownResponseToJson(DropDownResponse data) =>
    json.encode(data.toJson());

class DropDownResponse {
  DropDownResponse({
    this.groupName,
    this.options,
  });

  String groupName;
  List<Option> options;

  factory DropDownResponse.fromJson(Map<String, dynamic> json) =>
      DropDownResponse(
        groupName: json["groupName"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "groupName": groupName,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
