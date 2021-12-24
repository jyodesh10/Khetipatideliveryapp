import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:flutter/material.dart';

import '../../../theme.dart';

List status = ['All', 'Earnings', 'Withdrawn'];
String dropdownValue = 'All';

buildModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (context, setState) => SingleChildScrollView(
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
                        style: archivotitleStyle.copyWith(
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
                                  style: archivotitleStyle.copyWith(
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
                                  style: archivotitleStyle.copyWith(
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
                        style: archivotitleStyle.copyWith(
                            fontSize: getFont(16),
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(0, 0, 0, 0.5)),
                      ),
                      InkWell(
                        child: Container(
                          width: 352,
                          padding:
                              EdgeInsets.symmetric(horizontal: getWidth(10)),
                          height: getHeight(45),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(0, 0, 0, 0.1)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: dropdownValue,
                              items: <String>['All', 'Earnings', 'Withdrawn']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: archivotitleStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 0.5)),
                                  ),
                                );
                              }).toList(),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
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
          ),
        );
      });
}
