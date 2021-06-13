// To parse this JSON data, do
//
//     final userRequest = userRequestFromJson(jsonString);

import 'dart:convert';

UserRequest userRequestFromJson(String str) => UserRequest.fromJson(json.decode(str));

String userRequestToJson(UserRequest data) => json.encode(data.toJson());

class UserRequest {
    UserRequest({
        this.firstName,
        this.type,
        this.lastName,
        this.phoneNumber,
        this.homeNumber,
        this.fatherNumber,
        this.motherNumber,
        this.userName,
        this.password,
        this.gender,
        this.motherName,
        this.fatherName,
        this.address,
        this.birthDate,
        this.secId,
    });

    String firstName;
    String type;
    String lastName;
    String phoneNumber;
    String homeNumber;
    String fatherNumber;
    String motherNumber;
    String userName;
    String password;
    int gender;
    String motherName;
    String fatherName;
    String address;
    DateTime birthDate;
    int secId;

    factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        firstName: json["firstName"],
        type: json["type"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        homeNumber: json["homeNumber"],
        fatherNumber: json["fatherNumber"],
        motherNumber: json["motherNumber"],
        userName: json["userName"],
        password: json["password"],
        gender: json["gender"],
        motherName: json["motherName"],
        fatherName: json["fatherName"],
        address: json["address"],
        birthDate: DateTime.parse(json["birthDate"]),
        secId: json["secId"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "type": type,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "homeNumber": homeNumber,
        "fatherNumber": fatherNumber,
        "motherNumber": motherNumber,
        "userName": userName,
        "password": password,
        "gender": gender,
        "motherName": motherName,
        "fatherName": fatherName,
        "address": address,
        "birthDate": birthDate.toIso8601String(),
        "secId": secId,
    };
}
