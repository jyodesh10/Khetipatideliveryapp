import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:deliveryapp/widgets/text_field.dart';
import 'package:deliveryapp/theme.dart';
import 'package:flutter/material.dart';

class EditDocuments extends StatefulWidget {
  const EditDocuments({Key? key}) : super(key: key);

  @override
  _EditDocumentsState createState() => _EditDocumentsState();
}

class _EditDocumentsState extends State<EditDocuments> {
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
          'Edit Profile',
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
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 815,
                padding: EdgeInsets.symmetric(horizontal: getWidth(30)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Document Details',
                      style: robototitleStyle.copyWith(
                          fontSize: getFont(20),
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                        child: Column(
                      children: [
                        MyInputField(hint: 'Document Type'),
                        SizedBox(
                          height: 30,
                        ),
                        MyInputField(hint: 'Document Photo'),
                        SizedBox(
                          height: 30,
                        ),
                        MyInputField(hint: 'Document Number'),
                        SizedBox(
                          height: 30,
                        ),
                        MyInputField(hint: 'Issued date'),
                        SizedBox(
                          height: 30,
                        ),
                        MyInputField(hint: 'Issued district'),
                        SizedBox(
                          height: getHeight(50),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: getHeight(48),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            color: AppColors.mainGreen,
                            onPressed: () {},
                            child: Text(
                              'Save Changes',
                              style: robototitleStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: getFont(15),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
