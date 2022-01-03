import 'dart:convert';
import 'dart:io';

import 'package:deliveryapp/constant/api.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/controllers/dashboard_controller.dart';
import 'package:deliveryapp/models/edit_profile.dart';
import 'package:deliveryapp/screens/home/delivery.dart';
import 'package:deliveryapp/utils/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

class ProfileApi extends GetConnect {
  editProfile(String fullname, String email, String address, String phone,
      String gender, String dob, String token) async {
    try {
      var headers = {
        'Authorization': 'Bearer $token',
      };

      Map<String, String> formdata = {
        "full_name": fullname,
        "address": address,
        "email": email,
        "phone": phone,
        "gender": gender,
        "dob": dob,
        // "image": uploadImage(image),
      };

      var response = await http.post(
        Uri.parse(
          Url.base + "api/deliveryboy/editprofilesubmit",
        ),
        body: formdata,
        headers: headers,
      );

      if (response.statusCode == 200) {
        var responsedata = jsonEncode(response.body);

        print(responsedata);

        // Get.to(() => Delivery());
        // Get.back(result: true);
        // Get.delete();
        Get.off(() => Delivery());
        // DashboardController().fetchDashboardDetails();

        getSnackbar(
            message: "Successfully edited", bgColor: AppColors.mainGreen);
      } else {
        getSnackbar(message: "Error editing data");
        throw Exception('Failed to edit');
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  Future<String?> uploadImage(filepath) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          Url.base + "api/deliveryboy/editprofilesubmit",
        ));
    request.files.add(await http.MultipartFile.fromPath('image', filepath));
    var res = await request.send();
    return res.reasonPhrase;
  }

  Future fetchProfiledata(String token) async {
    // List<Dashboarddetails> dashboarddetails = [];
    const profileUrl = Url.base + "api/deliveryboy/editprofile";
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var response = await http.get(Uri.parse(profileUrl), headers: headers);

      if (response.statusCode == 200) {
        // print(response.body);
        final responsedata = jsonDecode(response.body);
        EditProfile data = EditProfile.fromJson(responsedata["data"]);
        return data;
      }
    } catch (e) {
      //  GetSnackBar(,)
    }
  }
}
