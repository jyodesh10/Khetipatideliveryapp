import 'dart:convert';

import 'package:deliveryapp/constant/api.dart';
import 'package:deliveryapp/models/orders.dart';
import 'package:get/get_connect.dart';

class OrdersApi extends GetConnect {
  getOrdersCompleted(String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      var response = await get(Url.base + 'api/deliveryboy/completedorders',
          headers: headers);

      if (response.statusCode == 200) {
        // final ResponseData = jsonDecode(response.body);
        // OrdersModel ordersData = OrdersModel.fromJson(ResponseData);
        // return ordersData;

        var data = (response.body);
        return data;
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      // TODO
    }
  }
}
