import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getSnackbar(
        {String? message,
        Color? bgColor,
        IconData? leadingIcon,
        bool error = true}) =>
    Get.showSnackbar(
      GetBar(
        onTap: (value) {
          Get.back();
        },
        duration: const Duration(milliseconds: 1600),
        message: message ?? "message",
        animationDuration: const Duration(milliseconds: 600),
        isDismissible: true,
        shouldIconPulse: false,
        dismissDirection: DismissDirection.down,
        icon: Icon(
          leadingIcon, //?? Icons.info_outline,
          color: Colors.white,
        ),
        backgroundColor: bgColor ?? (error ? Colors.red : Colors.green),
      ),
    );
