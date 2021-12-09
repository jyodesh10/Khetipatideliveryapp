// import 'package:deliveryapp/constant/colors.dart';
// import 'package:deliveryapp/constant/size_config.dart';
// import 'package:flutter/material.dart';

// List status = ['All', 'Earnings', 'Withdrawn'];
// String dropdownValue = 'All';

// settingModalBottomSheet(context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SingleChildScrollView(
//           child: Container(
//             margin: EdgeInsets.symmetric(
//                 horizontal: getWidth(30), vertical: getWidth(30)),
//             child: Column(
//               children: [
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Earnings Filter',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: getFont(16),
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(height: getHeight(15)),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Flexible(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'From',
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(0, 0, 0, 0.5)),
//                               ),
//                               SizedBox(
//                                 height: 45,
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                       labelText: '2021-01-01',
//                                       //hintText: "Full Name",

//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             width: 1,
//                                             color:
//                                                 Color.fromRGBO(0, 0, 0, 0.1)),
//                                         // borderRadius: BorderRadius.circular(15),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             width: 1, color: Colors.red),
//                                         borderRadius: BorderRadius.circular(0),
//                                       )),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Flexible(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'To',
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(0, 0, 0, 0.5)),
//                               ),
//                               SizedBox(
//                                 height: 45,
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                       labelText: '2021-01-01',
//                                       //hintText: "Full Name",
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             width: 1,
//                                             color:
//                                                 Color.fromRGBO(0, 0, 0, 0.1)),
//                                         // borderRadius: BorderRadius.circular(15),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             width: 1, color: Colors.red),
//                                         borderRadius: BorderRadius.circular(0),
//                                       )),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: getHeight(15),
//                     ),
//                     Text(
//                       'status',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Color.fromRGBO(0, 0, 0, 0.5)),
//                     ),
//                     InkWell(
//                       child: Container(
//                         width: 352,
//                         height: 45,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10, right: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Text(
//                               //   dropdownValue,
//                               //   style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
//                               // ),
//                               DropdownButton<String>(
//                                 items: <String>['All', 'Earnings', 'Withdrawn']
//                                     .map((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                                 value: dropdownValue,
//                                 icon: Icon(Icons.keyboard_arrow_down_rounded),
//                                 onChanged: (String? newValue) async {
//                                   // setState(() {
//                                   //   dropdownValue = newValue!;
//                                   // });
//                                 },
//                               ),
//                               // Icon(
//                               //   Icons.keyboard_arrow_down_sharp,
//                               //   color: Color.fromRGBO(0, 0, 0, 0.6),
//                               // )
//                             ],
//                           ),
//                         ),
//                       ),
//                       onTap: () {},
//                     ),
//                     SizedBox(
//                       height: getHeight(20),
//                     ),
//                     ButtonTheme(
//                       minWidth: getWidth(200),
//                       height: getHeight(48),
//                       child: RaisedButton(
//                         color: AppColors.mainGreen,
//                         onPressed: () {},
//                         child: Center(
//                           child: Text(
//                             'Search',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: getFont(15),
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }

// getWidth(int i) {}
