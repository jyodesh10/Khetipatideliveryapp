import 'package:deliveryapp/screens/orders/delivery_orders.dart';
import 'package:deliveryapp/screens/earnings/my_earnings.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:deliveryapp/screens/login/login.dart';
import 'package:deliveryapp/widgets/appbar.dart';
import 'package:deliveryapp/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import '../edit_profile/delivery_edit_profile.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppbar(null, 'Khetipati'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProfileTop(),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 815,
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(20), vertical: getHeight(22)),

              decoration: const BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  buildDeliveryProfileMenu(),
                  buildDeliveryPersonalInfoCard(),
                  SizedBox(
                    height: getHeight(20),
                  ),
                  logoutAndSwitchAccTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  profileOptions(optionIcon, optionName, subvalue, value) {
    return Container(
      width: getWidth(140),
      height: getHeight(57),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(191, 191, 191, 0.6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: getWidth(10),
          ),
          Image.asset(
            optionIcon,
            height: 20,
            // color: AppColors.mainGreen,
          ),
          SizedBox(
            width: getWidth(12),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    subvalue,
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(11),
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGreen),
                  ),
                  SizedBox(
                    width: getWidth(5),
                  ),
                  Text(
                    value,
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(15),
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGreen),
                  )
                ],
              ),
              Text(
                optionName,
                style: archivotitleStyle.copyWith(
                    fontSize: getFont(11),
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
          SizedBox(
            width: getWidth(10),
          ),
        ],
      ),
    );
  }

  buildDeliveryProfileMenu() {
    return Container(
      //  width: MediaQuery.of(context).size.width,
      // height: 170,
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(18), vertical: getHeight(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.035,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                mouseCursor: SystemMouseCursors.click,
                onTap: () {
                  Get.to(const MyEarnings());
                },
                child: profileOptions('assets/icons/myEarnings.png',
                    'My Earnings', 'Rs', '150.55'),
              ),
              SizedBox(
                width: getWidth(13),
              ),
              InkWell(
                onTap: () {
                  Get.to(const DeliveryOrders());
                },
                child: profileOptions(
                    'assets/icons/checked.png', 'Orders Completed', '', '50'),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(13),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.to(const DeliveryOrders());
                },
                child: profileOptions(
                    'assets/icons/pending.png', 'Orders Pending', '', '10'),
              ),
              SizedBox(
                width: getWidth(13),
              ),
              InkWell(
                onTap: () {
                  Get.to(const MyEarnings());
                },
                child: profileOptions('assets/icons/withdrawn.png',
                    'Amount Withdrawn', 'Rs', '100'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildDeliveryPersonalInfoCard() {
    return Container(
      margin: EdgeInsets.only(top: getHeight(22)),
      padding: EdgeInsets.only(top: getHeight(18)),
      width: MediaQuery.of(context).size.width,
      //height: getHeight(271),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Personal Information',
            style: archivotitleStyle.copyWith(
                color: Colors.black,
                fontSize: getFont(18),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: getHeight(19),
          ),
          divider(),
          SizedBox(
            height: getHeight(14),
          ),
          buildPersonalInfo('Name', "Sudarshan"),
          SizedBox(
            height: getHeight(29),
          ),
          buildPersonalInfo('Adress', 'Sankhamul, Kathmandu'),
          SizedBox(
            height: getHeight(29),
          ),
          buildPersonalInfo('Phone No.', "981284882"),
          SizedBox(
            height: getHeight(29),
          ),
          buildPersonalInfo('Email', "sudarshan@gmail.com"),
          SizedBox(
            height: getHeight(20),
          ),
        ],
      ),
    );
  }

  buildPersonalInfo(options, answers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(
              left: getWidth(26),
            ),
            child: Text(options,
                style: archivotitleStyle.copyWith(
                    color: Colors.black,
                    fontSize: getFont(16),
                    fontWeight: FontWeight.w400)),
          ),
        ),
        SizedBox(width: getWidth(30)),
        Expanded(
          flex: 3,
          child: Text(
            answers,
            style: archivotitleStyle.copyWith(
                color: Colors.black,
                fontSize: getFont(16),
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  logoutAndSwitchAccTile() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: getHeight(18)),
      width: MediaQuery.of(context).size.width,
      // height: getHeight(111),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: getWidth(20),
              ),
              Image.asset(
                'assets/icons/switchacc.png',
                height: 20,
              ),
              SizedBox(
                width: getWidth(20),
              ),
              Text(
                'Switch to other account',
                style: TextStyle(
                    fontSize: getFont(14),
                    fontWeight: FontWeight.w400,
                    color: AppColors.textblack),
              )
            ],
          ),
          SizedBox(height: getHeight(18)),
          divider(),
          SizedBox(height: getHeight(18)),
          InkWell(
            onTap: () {
              Get.to(() => const LoginPage());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getWidth(20),
                ),
                Image.asset(
                  'assets/icons/logout.png',
                  height: 20,
                ),
                SizedBox(
                  width: getWidth(20),
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: getFont(14), fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildProfileTop() {
    return Container(
      //height: 283,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: getHeight(35), bottom: getHeight(16)),
      color: AppColors.mainGreen,
      child: Column(
        children: [
          Image.asset(
            'assets/images/profile.png',
            height: getHeight(135),
            width: getWidth(135),
          ),
          SizedBox(
            height: getHeight(10),
          ),
          Text(
            "Howard Wollowitz",
            style: robototitleStyle.copyWith(
                fontSize: getFont(23),
                color: AppColors.textGreen,
                fontWeight: FontWeight.w700),
          ),
          Text(
            "Mangalbazar, Lalitpur",
            style: archivotitleStyle.copyWith(
                fontSize: getFont(14),
                color: AppColors.textGreen,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: getHeight(22),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DeliveryEditProfile()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromRGBO(255, 255, 255, 0.5)),
              child: Text(
                'Edit',
                style: archivotitleStyle.copyWith(
                    fontSize: getFont(15),
                    color: const Color.fromRGBO(2, 95, 51, 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
