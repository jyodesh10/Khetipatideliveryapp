import 'dart:convert';

import 'package:deliveryapp/constant/api.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/screens/home/delivery.dart';
import 'package:deliveryapp/utils/snackbar.dart';
import 'package:get/get_connect.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class ChangePasswordApi extends GetConnect {
  changepassword(String currentpassword, String password, String token) async {
    // List<Dashboarddetails> dashboarddetails = [];
    const changepasswordUrl = Url.base + "api/deliveryboy/changepassword";

    try {
      var headers = {
        'Authorization': 'Bearer $token',
      };
      Map<String, String> body = {
        "currentpassword": currentpassword,
        "password": password
      };
      var response = await http.post(Uri.parse(changepasswordUrl),
          headers: headers, body: body);

      if (response.statusCode == 200) {
        final responsedata = jsonEncode(response.body);
        print(responsedata);

        getSnackbar(
            message: ' Password change successful',
            bgColor: AppColors.mainGreen);
        Get.to(() => Delivery());
      } else {
        getSnackbar(message: ' Error changing password');
        throw Exception();
      }
    } catch (e) {
      //  GetSnackBar(,)
    }
  }
}
