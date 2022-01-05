import 'dart:convert';

OrdersModel ordersFromJson(String str) =>
    OrdersModel.fromJson(json.decode(str));

String ordersToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<dynamic>? data;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        status: json["status"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}
