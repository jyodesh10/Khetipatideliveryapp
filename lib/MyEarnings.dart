import 'dart:ui';

import 'package:deliveryapp/constant/colors.dart';
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
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'My Earnings',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded,
              size: 20, color: AppColors.textGreen),
        ),
        actions: [
          InkWell(
            child: Image.asset(
              'assets/icons/earningsmenu.png',
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopup(context));
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
              decoration: BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        right: MediaQuery.of(context).size.width * 0.08,
                        top: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 76,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(135, 194, 65, 0.3),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textGreen),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "200.0",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textGreen),
                                )
                              ],
                            ),
                            Text(
                              'Total Withdrawn',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textGreen),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        top: 20,
                        right: 0),
                    child: Text(
                      'Today',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  notificationWidget(
                      'Earned while Delivering from Shankhamul to Satdobato',
                      'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                      Color.fromRGBO(2, 95, 51, 1),
                      Color.fromRGBO(135, 194, 65, 0.5)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        top: 20,
                        right: 0),
                    child: Text(
                      'Yesterday',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  notificationWidget(
                      'Withdrawn Amount',
                      'Balance: 250.55',
                      Color.fromRGBO(216, 47, 47, 1),
                      Color.fromRGBO(216, 47, 47, 0.2)),
                  SizedBox(
                    height: 15,
                  ),
                  notificationWidget(
                      'Earned while Delivering from Shankhamul to Satdobato',
                      'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                      Color.fromRGBO(2, 95, 51, 1),
                      Color.fromRGBO(135, 194, 65, 0.5)),
                  SizedBox(
                    height: 15,
                  ),
                  notificationWidget(
                      'Withdrawn Amount',
                      'Balance: 250.55',
                      Color.fromRGBO(216, 47, 47, 1),
                      Color.fromRGBO(216, 47, 47, 0.2)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        top: 20,
                        right: 0),
                    child: Text(
                      '15th Aug. 2021',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  notificationWidget(
                      'Earned while Delivering from Shankhamul to Satdobato',
                      'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                      Color.fromRGBO(2, 95, 51, 1),
                      Color.fromRGBO(135, 194, 65, 0.5)),
                  SizedBox(
                    height: 15,
                  ),
                  notificationWidget(
                      'Withdrawn Amount',
                      'Balance: 250.55',
                      Color.fromRGBO(216, 47, 47, 1),
                      Color.fromRGBO(216, 47, 47, 0.2)),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      //bottomNavigationBar: BottomNav(),
    );
  }

  Widget notificationWidget(title, detail, iconColor, containerColor) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.08,
          top: 13,
          right: MediaQuery.of(context).size.width * 0.08),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //height: 154,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.width * 0.05,
          ),
          child: FittedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      'assets/icons/myearnings.png',
                      color: iconColor,
                    )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.468,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        detail,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '10 minutes ago',
                      style: TextStyle(
                          color: AppColors.textblack,
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Rs. 55',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGreen),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopup(BuildContext context) {
    return AlertDialog(
      // contentPadding: EdgeInsets.zero,
      content: Container(
        width: double.infinity,
        // padding: EdgeInsets.all(20),
        // height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Earnings Filter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.5)),
                      ),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: '2021-01-01',
                              //hintText: "Full Name",

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(0),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'To',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.5)),
                      ),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: '2021-01-01',
                              //hintText: "Full Name",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(0),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'status',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 0.5)),
            ),
            InkWell(
              child: Container(
                width: 352,
                height: 45,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
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
                        items: <String>['All', 'Earnings', 'Withdrawn']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: dropdownValue,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
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
              height: 15,
            ),
            SizedBox(
              height: 45,
              child: RaisedButton(
                color: AppColors.mainGreen,
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Search',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
