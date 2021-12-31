import 'dart:convert';

import 'package:deliveryapp/constant/api.dart';
import 'package:deliveryapp/models/dashboard.dart';
import 'package:get/get_connect.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class DashboardApi extends GetConnect {
  Future dashboardDetails(String token) async {
    // List<Dashboarddetails> dashboarddetails = [];
    const dashboardApi = Url.base + "api/deliveryboy/deliverydashboard";
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var response = await http.get(Uri.parse(dashboardApi), headers: headers);

      if (response.statusCode == 200) {
        // print(response.body);
        final responsedata = jsonDecode(response.body);
        // Map<String, dynamic> data = responsedata['data'];
        // Map<String, dynamic> details = data['dashboarddetails'];
        Dashboarddetails details =
            Dashboarddetails.fromJson(responsedata["data"]["dashboarddetails"]);
        return details;
      }
    } catch (e) {
      //  GetSnackBar(,)
    }
  }
}
