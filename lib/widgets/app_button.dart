import 'package:deliveryapp/constant/colors.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final Color? color;
  const MyButton(
      {Key? key, required this.label, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          width: 120,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color ?? AppColors.mainGreen,
          ),
          child: Text(label,
              style:
                  TextStyle(color: color != null ? primaryClr : Colors.white))),
    );
  }
}
