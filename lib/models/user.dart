import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.status,
    this.emailVerifiedAt,
    this.phone,
    this.imageId,
    this.createdAt,
    this.updatedAt,
    this.featureImage,
  });

  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? status;
  DateTime? emailVerifiedAt;
  String? phone;
  // ignore: unnecessary_question_mark
  dynamic? imageId;
  DateTime? createdAt;
  DateTime? updatedAt;
  FeatureImage? featureImage;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? "",
        firstname: json["firstname"] ?? "",
        lastname: json["lastname"] ?? "",
        email: json["email"] ?? "",
        status: json["status"] ?? "",
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        phone: json["phone"] ?? "",
        imageId: json["image_id"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        featureImage: FeatureImage.fromJson(json["feature_image"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "status": status,
        "email_verified_at": emailVerifiedAt!.toIso8601String(),
        "phone": phone,
        "image_id": imageId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "feature_image": featureImage!.toJson(),
      };
}

class FeatureImage {
  FeatureImage({
    this.thumbnailImage,
    this.originalImage,
  });

  dynamic thumbnailImage;
  dynamic originalImage;

  factory FeatureImage.fromJson(Map<String, dynamic> json) => FeatureImage(
        thumbnailImage: json["thumbnail_image"],
        originalImage: json["original_image"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail_image": thumbnailImage,
        "original_image": originalImage,
      };
}

User user = User(
  id: 0,
  firstname: "Ram Kumar",
  lastname: "Shrestha",
  email: "ram@gmail.com",
);
