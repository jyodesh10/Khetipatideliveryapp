import 'dart:ui';

import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:flutter/material.dart';

class MyEarnings extends StatefulWidget {
  const MyEarnings({Key? key}) : super(key: key);

  @override
  _MyEarningsState createState() => _MyEarningsState();
}

class _MyEarningsState extends State<MyEarnings> {
  List status = ['All', 'Earnings', 'Withdrawn'];
  String dropdownValue = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: AppBar(
        toolbarHeight: getHeight(70),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'My Earnings',
          style: TextStyle(
              fontSize: getFont(22),
              color: AppColors.textGreen,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded,
              size: 20, color: AppColors.textGreen),
        ),
        actions: [
          InkWell(
            child: Image.asset(
              'assets/icons/earningsmenu.png',
            ),
            onTap: () {
              _settingModalBottomSheet(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(27), vertical: getHeight(22)),
              decoration: const BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildEarningsCard(),
                  buildDate('Today'),
                  buildEarningsHistoryCard(
                      'Earned while Delivering from Shankhamul to Satdobato',
                      'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                      const Color.fromRGBO(2, 95, 51, 1),
                      const Color.fromRGBO(135, 194, 65, 0.5)),
                  buildDate('Yesterday'),
                  buildEarningsHistoryCard(
                      'Withdrawn Amount',
                      'Balance: 250.55',
                      const Color.fromRGBO(216, 47, 47, 1),
                      const Color.fromRGBO(216, 47, 47, 0.2)),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  buildEarningsHistoryCard(
                      'Earned while Delivering from Shankhamul to Satdobato',
                      'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                      const Color.fromRGBO(2, 95, 51, 1),
                      const Color.fromRGBO(135, 194, 65, 0.5)),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  buildEarningsHistoryCard(
                      'Withdrawn Amount',
                      'Balance: 250.55',
                      const Color.fromRGBO(216, 47, 47, 1),
                      const Color.fromRGBO(216, 47, 47, 0.2)),
                  buildDate('15th Aug. 2021'),
                  buildEarningsHistoryCard(
                      'Earned while Delivering from Shankhamul to Satdobato',
                      'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                      const Color.fromRGBO(2, 95, 51, 1),
                      const Color.fromRGBO(135, 194, 65, 0.5)),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  buildEarningsHistoryCard(
                      'Withdrawn Amount',
                      'Balance: 250.55',
                      const Color.fromRGBO(216, 47, 47, 1),
                      const Color.fromRGBO(216, 47, 47, 0.2)),
                  SizedBox(
                    height: getHeight(15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildEarningsHistoryCard(title, detail, iconColor, containerColor) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: 154,
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(20), vertical: getHeight(20)),
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
                    'assets/icons/earnings.png',
                    height: 15,
                    color: iconColor,
                  ),
                  backgroundColor: containerColor),
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
                      style: TextStyle(
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
                      style: TextStyle(
                          fontSize: getFont(12), fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  Text(
                    '10 minutes ago',
                    style: TextStyle(
                        color: AppColors.textblack,
                        fontSize: getFont(11),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Rs. 55',
            style: TextStyle(
                fontSize: getFont(18),
                fontWeight: FontWeight.w500,
                color: AppColors.textGreen),
          ),
        ],
      ),
    );
  }

  buildEarningsCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: getHeight(76),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(135, 194, 65, 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rs.',
                  style: TextStyle(
                      fontSize: getFont(20),
                      fontWeight: FontWeight.w700,
                      color: AppColors.textGreen),
                ),
                SizedBox(
                  width: getWidth(5),
                ),
                Text(
                  "200.0",
                  style: TextStyle(
                      fontSize: getFont(25),
                      fontWeight: FontWeight.w700,
                      color: AppColors.textGreen),
                )
              ],
            ),
            Text(
              'Total Withdrawn',
              style: TextStyle(
                  fontSize: getFont(12),
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGreen),
            )
          ],
        ),
      ),
    );
  }

  buildDate(date) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHeight(15)),
      child: Text(
        date,
        style: TextStyle(
            color: const Color.fromRGBO(0, 0, 0, 0.6),
            fontSize: getFont(14),
            fontWeight: FontWeight.w400),
      ),
    );
  }

  _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getWidth(30), vertical: getWidth(30)),
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Earnings Filter',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: getFont(16),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: getHeight(15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'From',
                                  style: TextStyle(
                                      fontSize: getFont(16),
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.5)),
                                ),
                                SizedBox(
                                  height: getHeight(45),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: '2021-01-01',
                                        //hintText: "Full Name",

                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1)),
                                          // borderRadius: BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: getWidth(10),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'To',
                                  style: TextStyle(
                                      fontSize: getFont(16),
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.5)),
                                ),
                                SizedBox(
                                  height: getHeight(45),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: '2021-01-01',
                                        //hintText: "Full Name",
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1)),
                                          // borderRadius: BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                      Text(
                        'status',
                        style: TextStyle(
                            fontSize: getFont(16),
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(0, 0, 0, 0.5)),
                      ),
                      InkWell(
                        child: Container(
                          //   width: 352,
                          height: getHeight(45),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(0, 0, 0, 0.1)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //   dropdownValue,
                                //   style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
                                // ),
                                DropdownButton<String>(
                                  items: <String>[
                                    'All',
                                    'Earnings',
                                    'Withdrawn'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  value: dropdownValue,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  onChanged: (String? newValue) async {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                ),
                                // Icon(
                                //   Icons.keyboard_arrow_down_sharp,
                                //   color: Color.fromRGBO(0, 0, 0, 0.6),
                                // )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      ButtonTheme(
                        minWidth: getWidth(200),
                        height: getHeight(48),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: AppColors.mainGreen,
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getFont(15),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
