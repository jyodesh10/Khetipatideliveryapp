import 'dart:ui';

import 'package:deliveryapp/DeliveryOrders.dart';
import 'package:deliveryapp/myEarnings.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'LoginRegisterPage/login.dart';
import 'deliveryEditProfile.dart';

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
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'KhetiPati',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.bold),
        ),
        // leading: IconButton(
        //     onPressed: () {
        //       //  Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.arrow_back_ios_rounded,
        //         size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: 283,
              width: MediaQuery.of(context).size.width,
              color: AppColors.mainGreen,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 33,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: 135,
                      width: 135,
                    ),
                  ),
                  Text(
                    "Howard Wollowitz",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Mangalbazar, Lalitpur",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[900],
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 255, 255, 0.5),
                        textStyle: const TextStyle(
                            fontSize: 15, color: Color.fromRGBO(2, 95, 51, 1))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryEditProfile()),
                      );
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 15, color: Color.fromRGBO(2, 95, 51, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 815,
              padding: EdgeInsets.only(
                  right: getWidth(20), left: getWidth(20), top: getHeight(22)),
              decoration: BoxDecoration(
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
                  logoutAndSwitchAccCard(),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileOptions(optionIcon, optionName, curr, price) {
    return Container(
      width: getWidth(152),
      height: getHeight(57),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(191, 191, 191, 0.6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Image.asset(
            optionIcon,
            // color: AppColors.mainGreen,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    curr,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGreen),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGreen),
                  )
                ],
              ),
              Text(
                optionName,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget PersonalInfo(options, answers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.090,
            ),
            child: Text(options,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: Text(
            answers,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  buildDeliveryProfileMenu() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                mouseCursor: SystemMouseCursors.click,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyEarnings()),
                  );
                },
                child: profileOptions('assets/icons/myEarnings.png',
                    'My Earnings', 'Rs', '150.55'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeliveryOrders()),
                  );
                },
                child: profileOptions(
                    'assets/icons/checked.png', 'Orders Completed', '', '50'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeliveryOrders()),
                  );
                },
                child: profileOptions(
                    'assets/icons/pending.png', 'Orders Pending', '', '10'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyEarnings()),
                  );
                },
                child: profileOptions('assets/icons/withdrawn.png',
                    'Amount Withdrawn', 'Rs', '100'),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
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
            style:
                TextStyle(fontSize: getFont(18), fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: getHeight(10),
          ),
          const Divider(
            color: Color.fromRGBO(186, 186, 186, 0.5),
          ),
          SizedBox(
            height: getHeight(10),
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
                style: TextStyle(
                    fontSize: getFont(16), fontWeight: FontWeight.w400)),
          ),
        ),
        SizedBox(width: getWidth(30)),
        Expanded(
          flex: 3,
          child: Text(
            answers,
            style:
                TextStyle(fontSize: getFont(16), fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  logoutAndSwitchAccCard() {
    return Container(
      margin: EdgeInsets.only(top: getHeight(22)),
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
          SizedBox(height: getHeight(10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: getWidth(20),
              ),
              Image.asset(
                'assets/icons/switchacc.png',
                height: 17,
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
          SizedBox(height: getHeight(10)),
          const Divider(),
          SizedBox(height: getHeight(10)),
          InkWell(
            onTap: () {
              Get.to(() => LoginPage());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getWidth(20),
                ),
                const Icon(
                  Icons.logout_outlined,
                  size: 20,
                  color: Color.fromRGBO(216, 47, 47, 1),
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
          SizedBox(height: getHeight(10)),
        ],
      ),
    );
  }
}
