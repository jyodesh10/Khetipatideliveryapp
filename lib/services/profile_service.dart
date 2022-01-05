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

      var formdata = {
        "full_name": fullname,
        "address": address,
        "email": email,
        "phone": phone,
        "gender": gender,
        "dob": dob,
        // "profile_image": MultipartFile(image, filename: "image.jpg")
      };

      var response = await http.post(
          Uri.parse(Url.base + "api/deliveryboy/editprofilesubmit"),
          body: formdata,
          headers: headers);

      if (response.statusCode == 200) {
        var responsedata = jsonEncode(response.body);

        print(responsedata);

        Get.back(result: "success");

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

  uploadImage(String token, File image) async {
    try {
      var headers = {
        'Authorization': 'Bearer  $token',
      };
      final form = FormData({
        "profile_image": MultipartFile(image, filename: 'pipi.jpg'),
      });
      final response = await post(
          Url.base + "api/deliveryboy/editprofilesubmit", form,
          headers: headers);
      if (response.statusCode == 200) {
        var responsedata = jsonEncode(response.body);
        print(response.body);
        getSnackbar(message: 'Image uploaded', bgColor: AppColors.mainGreen);
      } else {
        throw Exception();
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
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
