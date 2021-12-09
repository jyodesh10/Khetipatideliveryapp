import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/screens/login/login.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'dart:async';

import 'constant/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      // set your desired delay time here
      Get.to(const LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('assets/images/applogo1.png',
            width: MediaQuery.of(context).size.width / 1.5,
            fit: BoxFit.scaleDown),
      ),
    );
  }
}
