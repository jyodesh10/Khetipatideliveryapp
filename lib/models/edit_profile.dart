// To parse this JSON data, do
//
//     final editProfile = editProfileFromJson(jsonString);

import 'dart:convert';

EditProfile editProfileFromJson(String str) =>
    EditProfile.fromJson(json.decode(str));

String editProfileToJson(EditProfile data) => json.encode(data.toJson());

class EditProfile {
  EditProfile({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
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
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.image,
    this.deliveryboydetails,
  });

  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  dynamic image;
  dynamic deliveryboydetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        deliveryboydetails: json["deliveryboydetails"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "image": image,
        "deliveryboydetails": deliveryboydetails,
      };
}
