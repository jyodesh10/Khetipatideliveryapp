// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  Dashboard({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.dashboarddetails,
  });

  Dashboarddetails? dashboarddetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dashboarddetails: Dashboarddetails.fromJson(json["dashboarddetails"]),
      );

  Map<String, dynamic> toJson() => {
        "dashboarddetails": dashboarddetails?.toJson(),
      };
}

class Dashboarddetails {
  Dashboarddetails({
    this.user,
    this.totalorderscompleted,
    this.totalorderspending,
    this.earnings,
  });

  User? user;
  int? totalorderscompleted;
  int? totalorderspending;
  int? earnings;

  factory Dashboarddetails.fromJson(Map<String, dynamic> json) =>
      Dashboarddetails(
        user: User.fromJson(json["user"]),
        totalorderscompleted: json["totalorderscompleted"],
        totalorderspending: json["totalorderspending"],
        earnings: json["earnings"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "totalorderscompleted": totalorderscompleted,
        "totalorderspending": totalorderspending,
        "earnings": earnings,
      };
}

class User {
  User({
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.image,
  });

  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  dynamic image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "image": image,
      };
}
