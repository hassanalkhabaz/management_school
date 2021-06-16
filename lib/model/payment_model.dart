import 'dart:convert';

List<PaymentModel> paymentModelFromJson(String str) => List<PaymentModel>.from(
    json.decode(str).map((x) => PaymentModel.fromJson(x)));

String paymentModelToJson(List<PaymentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentModel {
  PaymentModel({
    this.userId,
    this.userName,
    this.paidFees,
    this.unPaidFees,
    this.paidDate,
  });

  String userId;
  String userName;
  int paidFees;
  int unPaidFees;
  var paidDate;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        userId: json["userId"],
        userName: json["userName"],
        paidFees: json["paidFees"],
        unPaidFees: json["unPaidFees"],
        paidDate:json["paidDate"]!=null? DateTime.parse(json["paidDate"]):"no info",
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "paidFees": paidFees,
        "unPaidFees": unPaidFees,
        "paidDate": paidDate.toIso8601String(),
      };
}
