import 'package:deliveryapp/models/user.dart';
import 'package:deliveryapp/screens/home/delivery.dart';
import 'package:deliveryapp/screens/home/home.dart';
import 'package:deliveryapp/services/user_services.dart';
import 'package:deliveryapp/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var authState = AuthState.UnAuthenticated.obs;
  var token = "".obs;
  var user = User().obs;
  loginWithEmail({required String email, required String password}) async {
    authState.value = AuthState.Authenticating;

    var user = await userrepo.loginWithEmailandPassword(email, password);

    if (user != null) {
      token.value = user[1];
      authState.value = AuthState.Authenticated;
      print(token.value);
      Get.offAll(() => HomeScreen());
    } else {
      getSnackbar(message: 'Error login');
      authState.value = AuthState.UnAuthenticated;
    }
  }
}

final authController = Get.find<AuthController>();
enum AuthState { UnAuthenticated, Authenticated, Authenticating }
