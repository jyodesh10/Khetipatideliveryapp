import 'package:deliveryapp/models/user.dart';
import 'package:deliveryapp/screens/home/delivery.dart';
import 'package:deliveryapp/screens/home/home.dart';
import 'package:deliveryapp/services/user_services.dart';
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
      Get.to(() => HomeScreen());
    } else {
      const SnackBar(
        content: Text('Error login'),
        backgroundColor: Colors.red,
      );
      // GetSnackBar(
      //   title: 'Error',
      // );
      authState.value = AuthState.UnAuthenticated;
    }
  }
}

final authController = Get.find<AuthController>();
enum AuthState { UnAuthenticated, Authenticated, Authenticating }
