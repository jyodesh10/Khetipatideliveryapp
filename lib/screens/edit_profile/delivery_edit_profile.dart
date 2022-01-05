import 'dart:io';

import 'package:deliveryapp/controllers/dashboard_controller.dart';
import 'package:deliveryapp/controllers/profile_controller.dart';
import 'package:deliveryapp/screens/edit_document/edit_documents.dart';
import 'package:deliveryapp/utils/snackbar.dart';
import 'package:deliveryapp/utils/validators.dart';
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
  State<DeliveryEditProfile> createState() => _DeliveryEditProfileState();
}

class _DeliveryEditProfileState extends State<DeliveryEditProfile> {
  ProfileController controller = Get.put(ProfileController());

  File? image;

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

  buildEditProfileTop() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.mainGreen,
      child: Column(
        children: [
          Obx(() => Container(
              margin:
                  EdgeInsets.only(top: getHeight(33), bottom: getHeight(15)),
              child: controller.selectedImagePath.value == ''
                  ?
                  // const Center(
                  //     child: CircularProgressIndicator(),
                  //   )
                  // Image.network(controller.editProfile.value?.image)
                  Image.asset(
                      'assets/images/profile.png',
                      height: getHeight(135),
                      width: getWidth(135),
                    )
                  : Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              radius: 58,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: FileImage(
                                File(controller.selectedImagePath.value),
                              )
                              // child: ClipRRect(
                              //   // borderRadius: BorderRadius.circular(50),
                              //   child: Image.file(
                              //     File(controller.selectedImagePath.value),
                              //     // fit: BoxFit.contain,
                              //   ),
                              // ),
                              ),
                        ),
                        Text(controller.selectedImageSize.value)
                      ],
                    ))),
          GestureDetector(
            onTap: () {
              controller.getImage();
            },
            child: Text(
              "Change Profile Picture",
              style: archivotitleStyle.copyWith(
                  fontSize: getFont(16),
                  color: Colors.green[900],
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: getHeight(20),
          )
        ],
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
          MyInputField(
            hint: 'Full Name',
            controller: controller.fullname,
          ),
          SizedBox(
            height: getHeight(30),
          ),
          MyInputField(
            hint: 'Address',
            controller: controller.address,
          ),
          SizedBox(
            height: getHeight(30),
          ),
          MyInputField(
            hint: 'Phone Number',
            controller: controller.phone,
          ),
          SizedBox(
            height: getHeight(30),
          ),
          MyInputField(
            hint: 'Email',
            controller: controller.email,
          ),
          SizedBox(
            height: getHeight(30),
          ),
          MyInputField(
            hint: 'Date of Birth',
            controller: controller.dob,
          ),
          SizedBox(
            height: getHeight(30),
          ),
          MyInputField(
            hint: 'Gender',
            controller: controller.gender,
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
              onPressed: () {
                if (controller.email != null) {
                  controller.edit_profile();
                  controller
                      .uploadImage(File(controller.selectedImagePath.value));

                  DashboardController().fetchDashboardDetails();
                } else {
                  getSnackbar(message: 'Error editing data');
                }
              },
              child: Text(
                'Save Changes',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getFont(15),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: getHeight(30),
          ),
        ],
      )),
    );
  }

  changePasswordButton() {
    return InkWell(
      onTap: () {
        // buildBottomsheet(context);
        settingModalBottomSheet(context);
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
}

settingModalBottomSheet(context) {
  ProfileController controller = Get.put(ProfileController());
  final _formKey = GlobalKey<FormState>();

  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
            child:
                //   Obx(
                // () =>
                Container(
          margin: EdgeInsets.symmetric(
              horizontal: getWidth(30), vertical: getWidth(30)),
          child: Form(
            key: _formKey,
            child: Column(
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
                InputField(
                  validator: (v) => validatePassword(string: v),
                  label: 'Current Password',
                  obscureText: true,
                  controller: controller.currentpassword,
                ),
                // Text(
                //   'Forgot Password?',
                //   style: archivotitleStyle.copyWith(
                //       color: const Color.fromRGBO(0, 0, 0, 0.5),
                //       fontSize: getFont(12),
                //       fontWeight: FontWeight.w400),
                // ),
                SizedBox(
                  height: getHeight(15),
                ),
                InputField(
                  validator: (v) {
                    validatePassword(string: v);
                    confirmPassword(
                        password: controller.newpassword.text,
                        cPassword: controller.confirmpassword.text);
                  },
                  obscureText: true,
                  label: 'New Password',
                  controller: controller.newpassword,
                ),
                // Text(
                //   'Must be 8 characters long.',
                //   style: archivotitleStyle.copyWith(
                //       color: const Color.fromRGBO(0, 0, 0, 0.5),
                //       fontSize: getFont(12),
                //       fontWeight: FontWeight.w400),
                // ),
                SizedBox(
                  height: getHeight(15),
                ),
                InputField(
                  validator: (v) {
                    validatePassword(string: v);
                    confirmPassword(
                        password: controller.newpassword.text,
                        cPassword: controller.confirmpassword.text);
                  },
                  obscureText: true,
                  label: 'Confirm Password',
                  controller: controller.confirmpassword,
                ),
                // Text(
                //   'Must be 8 characters long.',
                //   style: archivotitleStyle.copyWith(
                //       color: const Color.fromRGBO(0, 0, 0, 0.5),
                //       fontSize: getFont(12),
                //       fontWeight: FontWeight.w400),
                // ),
                SizedBox(
                  height: getHeight(20),
                ),
                ButtonTheme(
                  minWidth: getWidth(200),
                  height: getHeight(48),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: AppColors.mainGreen,
                    onPressed: () {
                      {
                        if (_formKey.currentState!.validate()) {
                          controller.change_password();
                        }
                      }
                      // if (controller.newpassword !=
                      //     controller.confirmpassword) {}
                      // controller.change_password();
                    },
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
          ),
          // ),
        ));
      });
}

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.controller,
      required this.validator,
      this.icon,
      required this.label,
      this.obscureText = false})
      : super(key: key);
  final IconData? icon;
  final TextEditingController controller;
  // ignore: prefer_typing_uninitialized_variables
  final validator;
  final String label;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getFont(45),
      width: getFont(352),
      child: Center(
        child: TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
              // prefixIcon: Icon(icon, size: 20),

              hintText: label,
              hintStyle: subtitleStyle,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(0, 0, 0, 0.1))),
              // errorBorder: OutlineInputBorder(
              //   borderSide:
              //       const BorderSide(width: 1, color: AppColors.mainGreen),
              //   borderRadius: BorderRadius.circular(5),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.mainGreen),
                borderRadius: BorderRadius.circular(5),
              )),
        ),
      ),
    );
  }
}
