import 'dart:io';

import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/controllers/auth_controller.dart';
import 'package:deliveryapp/models/edit_profile.dart';
import 'package:deliveryapp/services/change_password.dart';
import 'package:deliveryapp/services/profile_service.dart';
import 'package:deliveryapp/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

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

  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;
  String imagePath = '';

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
      print(response.body["profile_image"]);
    } finally {
      isloading(false);
    }
  }

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      // uploadImage(File(selectedImagePath.value));

    } else {
      getSnackbar(
        message: 'No image selected',
      );
    }
  }

  void uploadImage(File file) {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    ProfileApi().uploadImage(authController.token.value, file).then((resp) {
      Get.back();
      if (resp == "success") {
        getSnackbar(
            message: 'Success File Uploaded', bgColor: AppColors.mainGreen);
      } else if (resp == "fail") {
        getSnackbar(message: 'Error uploading file ');
      }
    }, onError: (err) {
      Get.back();
      getSnackbar(message: 'Error uploading file ');
    });
  }

  // ignore: non_constant_identifier_names
  change_password() async {
    var response = await ChangePasswordApi().changepassword(
        currentpassword.text, newpassword.text, authController.token.value);
  }
}
