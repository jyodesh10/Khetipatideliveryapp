import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:deliveryapp/widgets/appbar.dart';
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
      appBar: buildAppbar(Icons.arrow_back_ios, 'Edit Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [buildEditDocumentsBody()],
        ),
      ),
    );
  }

  buildEditDocumentsBody() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 800,
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(30), vertical: getHeight(50)),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Document Details',
              style: robototitleStyle.copyWith(
                  fontSize: getFont(20),
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getHeight(30),
            ),
            buildEditDocumentsForm()
          ],
        ));
  }

  buildEditDocumentsForm() {
    return Form(
      child: Column(
        children: [
          const MyInputField(hint: 'Document Type'),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(hint: 'Document Photo'),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(hint: 'Document Number'),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(hint: 'Issued date'),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(hint: 'Issued district'),
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
      ),
    );
  }
}
