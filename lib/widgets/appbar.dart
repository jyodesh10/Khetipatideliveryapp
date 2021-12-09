import 'package:deliveryapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

buildAppbar(IconData? icon, title) {
  return AppBar(
    toolbarHeight: 70.h,
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.mainGreen,
    centerTitle: true,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        icon,
        size: 20,
        color: AppColors.textGreen,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title: Text(
      title,
      style: TextStyle(
          fontSize: 22.sp,
          color: AppColors.textGreen,
          fontWeight: FontWeight.bold),
    ),
  );
}
