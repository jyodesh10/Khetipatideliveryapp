import 'dart:io';

import 'package:deliveryapp/controllers/auth_controller.dart';
import 'package:deliveryapp/models/edit_profile.dart';
import 'package:deliveryapp/services/change_password.dart';
import 'package:deliveryapp/services/profile_service.dart';
import 'package:deliveryapp/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();

  var editProfile = Data().obs;
  var isloading = true.obs;
  final fullname = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final dob = TextEditingController();
  final gender = TextEditingController();
  final currentpassword = TextEditingController();
  final newpassword = TextEditingController();
  final confirmpassword = TextEditingController();

  // late File image;
  // late String imagePath;
  // late File image;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  String imagePath = '';
  final _picker = ImagePicker();

  // PickedFile? imageFile = null.obs as PickedFile?;

  @override
  void onInit() {
    super.onInit();
  }

  edit_profile() async {
    try {
      isloading(true);
      var response = await ProfileApi().editProfile(
          fullname.text,
          email.text,
          address.text,
          phone.text,
          gender.text,
          dob.text,
          authController.token.value);
      print(response.body);

      // if (response.statuscode == 200) {
      //   Get.to(Delivery());
      // }
      // print(items.toJson().toString());
      // if (items != null) {
      //   editProfile.value = items;
      // }
    } finally {
      isloading(false);
    }
  }

  upload_image() async {
    var response =
        await ProfileApi().uploadImage(File(selectedImagePath.value));
  }

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 2000)
                  .toStringAsFixed(2) +
              " Mb";
    } else {
      getSnackbar(
        message: 'No image selected',
      );
    }
  }

  change_password() async {
    var response = await ChangePasswordApi().changepassword(
        currentpassword.text, newpassword.text, authController.token.value);
  }
}
