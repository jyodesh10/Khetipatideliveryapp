import 'dart:convert';

import 'package:deliveryapp/constant/api.dart';
import 'package:deliveryapp/models/edit_profile.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

class ProfileApi extends GetConnect {
  Future<Data> editProfile(String firstname, String lastname, String email,
      int phone, String token) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var body = jsonEncode(<String, dynamic>{
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "phone": phone,
    });
    var response = await http.post(
        Uri.parse(
          Url.base + "api/deliveryboy/editprofilesubmit",
        ),
        headers: headers,
        body: body);

    if (response.statusCode == 201) {
      var responsedata = jsonDecode(response.body);
      return Data.fromJson(responsedata);
      // Data edit = Data.fromJson(responsedata["data"]);
      // return edit;
    } else {
      throw Exception('Failed to edit');
    }
  }
}
