import 'dart:convert';

import 'package:deliveryapp/constant/api.dart';
import 'package:deliveryapp/controllers/auth_controller.dart';
import 'package:deliveryapp/models/dashboard.dart';
import 'package:deliveryapp/services/daskboard_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();

  // var dashboarddetails = <Dashboarddetails>[].obs;
  var dashboarddetail = Dashboarddetails().obs;
  var isloading = true.obs;

  final count = 0.obs;

  @override
  void onInit() {
    fetchDashboardDetails();
    // fetchDetails();

    super.onInit();
  }

  fetchDashboardDetails() async {
    //dashboarddetail.value = ;
    try {
      isloading(true);
      var items =
          await DashboardApi().dashboardDetails(authController.token.value);
      print(items.toJson().toString());
      if (items != null) {
        dashboarddetail.value = items;
      }
    } finally {
      isloading(false);
    }
  }

  // fetchDetails() async {
  //   var details =
  //       await DashboardApi().dashboardDetails(authController.token.value);
  //   dashboarddetail = details;
  //   print(dashboarddetail);
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

var data = {
  "status": "success",
  "message": "Successfully sent",
  "data": {
    "dashboarddetails": {
      "user": {
        "firstname": "admin",
        "lastname": "admin",
        "email": "admin@gmail.com",
        "phone": "9841463556",
        "image": null
      },
      "totalorderscompleted": 0,
      "totalorderspending": 0,
      "earnings": 0
    }
  }
};
