import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:flutter/material.dart';

import '../../../theme.dart';

buildEarningsHistoryCard(title, detail, value) {
  bool withdrawn = value;
  return Container(
    width: double.infinity,
    //height: 154,
    padding:
        EdgeInsets.symmetric(horizontal: getWidth(20), vertical: getHeight(20)),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 15,
                child: Image.asset(
                  'assets/icons/wallet.png',
                  height: getHeight(18),
                  color: withdrawn
                      // ignore: dead_code
                      ? const Color.fromRGBO(216, 47, 47, 1)
                      : const Color.fromRGBO(2, 95, 51, 1),
                ),
                backgroundColor: withdrawn
                    // ignore: dead_code
                    ? const Color.fromRGBO(216, 47, 47, 0.2)
                    : const Color.fromRGBO(135, 194, 65, 0.5)),
            SizedBox(
              width: getWidth(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getWidth(170),
                  child: Text(
                    title,
                    style: robototitleStyle.copyWith(
                        color: Colors.black,
                        fontSize: getFont(14),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: getHeight(15),
                ),
                SizedBox(
                  width: getWidth(170),
                  child: Text(
                    detail,
                    style: archivotitleStyle.copyWith(
                        color: Colors.black54,
                        fontSize: getFont(12),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: getHeight(15),
                ),
                Text(
                  '10 minutes ago',
                  style: archivotitleStyle.copyWith(
                      color: Colors.black54,
                      fontSize: getFont(11),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        Text(
          'Rs. 55',
          style: robototitleStyle.copyWith(
              fontSize: getFont(18),
              fontWeight: FontWeight.w500,
              color: AppColors.textGreen),
        ),
      ],
    ),
  );
}
