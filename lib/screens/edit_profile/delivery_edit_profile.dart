import 'package:deliveryapp/screens/edit_document/edit_documents.dart';
import 'package:deliveryapp/widgets/appbar.dart';
import 'package:deliveryapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../../constant/size_config.dart';
import '../../theme.dart';

class DeliveryEditProfile extends StatefulWidget {
  const DeliveryEditProfile({Key? key}) : super(key: key);

  @override
  _DeliveryEditProfileState createState() => _DeliveryEditProfileState();
}

class _DeliveryEditProfileState extends State<DeliveryEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppbar(Icons.arrow_back_ios, 'Edit Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildEditProfileTop(),
            Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: buildEditProfileForm())
          ],
        ),
      ),
    );
  }

  buildEditProfileForm() {
    return Container(
      margin: EdgeInsets.only(left: getWidth(30), right: getWidth(30)),
      child: Form(
          child: Column(
        children: [
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Full Name',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Address',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Phone Number',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Email',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Date of Birth',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Gender',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          changePasswordButton(),
          SizedBox(
            height: getHeight(30),
          ),
          documentsButton(),
          SizedBox(
            height: getHeight(30),
          ),
          ButtonTheme(
            minWidth: getWidth(352),
            height: getHeight(48),
            // ignore: deprecated_member_use
            child: RaisedButton(
              color: AppColors.mainGreen,
              onPressed: () {},
              child: Text(
                'Save Changes',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getFont(15),
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      )),
    );
  }

  changePasswordButton() {
    return InkWell(
      onTap: () {
        // buildBottomsheet(context);
        _settingModalBottomSheet(context);
      },
      child: Container(
        height: getHeight(45),
        //  width: getWidth(352),
        decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: const Color.fromRGBO(0, 0, 0, 0.1)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: getWidth(20)),
              child: Text(
                'Change Password',
                style: archivotitleStyle.copyWith(
                    color: Colors.black,
                    fontSize: getFont(18),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: getWidth(15)),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: getFont(15),
                color: const Color.fromRGBO(147, 147, 147, 0.8),
              ),
            )
          ],
        ),
      ),
    );
  }

  documentsButton() {
    return InkWell(
      onTap: () {
        Get.to(const EditDocuments());
      },
      child: Container(
        height: getHeight(45),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: const Color.fromRGBO(0, 0, 0, 0.1)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Documents',
                style: archivotitleStyle.copyWith(
                    color: Colors.black,
                    fontSize: getFont(18),
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Color.fromRGBO(147, 147, 147, 0.8),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildEditProfileTop() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.mainGreen,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: getHeight(33), bottom: getHeight(15)),
            child: Image.asset(
              'assets/images/profile.png',
              height: getHeight(135),
              width: getWidth(135),
            ),
          ),
          Text(
            "Change Profile Picture",
            style: archivotitleStyle.copyWith(
                fontSize: getFont(16),
                color: Colors.green[900],
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: getHeight(20),
          )
        ],
      ),
    );
  }
}

void _settingModalBottomSheet(context) {
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
                      'New Password must be different from current password.',
                      style: archivotitleStyle.copyWith(
                          color: Colors.black,
                          fontSize: getFont(16),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: getHeight(15)),
                    const MyInputField(hint: 'Current Password'),
                    Text(
                      'Forgot Password?',
                      style: archivotitleStyle.copyWith(
                          color: const Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: getFont(12),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    const MyInputField(hint: 'New Password'),
                    Text(
                      'Must be 8 characters long.',
                      style: archivotitleStyle.copyWith(
                          color: const Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: getFont(12),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    const MyInputField(hint: 'Confirm Password'),
                    Text(
                      'Must be 8 characters long.',
                      style: archivotitleStyle.copyWith(
                          color: const Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: getFont(12),
                          fontWeight: FontWeight.w400),
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
                            'Save Changes',
                            style: archivotitleStyle.copyWith(
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
