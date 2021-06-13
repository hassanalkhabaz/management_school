import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.succeeded,
    this.message,
    this.errors,
    this.data,
  });

  bool succeeded;
  String message;
  List<String> errors;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        succeeded: json["succeeded"],
        message: json["message"],
        errors: List<String>.from(json["errors"].map((x) => x)),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "message": message,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.userName,
    this.email,
    this.jwtToken,
    this.refreshToken,
  });

  String id;
  String userName;
  String email;
  String jwtToken;
  String refreshToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        jwtToken: json["jwtToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "email": email,
        "jwtToken": jwtToken,
        "refreshToken": refreshToken,
      };
}
