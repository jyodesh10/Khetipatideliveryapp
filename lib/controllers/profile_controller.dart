import 'package:deliveryapp/models/edit_profile.dart';
import 'package:deliveryapp/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();

  var editProfile = Data().obs;
  var isloading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  edit_profile() async {
    try {
      isloading(true);
      var items = await ProfileApi().editProfile("", "", "", 0, "");
      print(items.toJson().toString());
      if (items != null) {
        editProfile.value = items;
      }
    } finally {
      isloading(false);
    }
  }
}
