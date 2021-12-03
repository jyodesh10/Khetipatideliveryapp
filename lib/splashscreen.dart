import 'package:deliveryapp/LoginRegisterPage/login.dart';
import 'package:deliveryapp/constant/colors.dart';
import "package:flutter/material.dart";
import 'dart:async';

import 'constant/size_config.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 2000), () {
      // set your desired delay time here
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('assets/images/applogo.png',
            width: MediaQuery.of(context).size.width / 1.5,
            fit: BoxFit.scaleDown),
      ),
    );
  }
}
