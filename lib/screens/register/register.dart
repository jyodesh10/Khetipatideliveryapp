import 'package:deliveryapp/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: AppBar(
        toolbarHeight: 80.sp,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Registration',
          style: TextStyle(
              fontSize: 22.sp,
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Get.to(const LoginPage());
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: 20.sp, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              buildLoginDetailsTile(),
              SizedBox(
                height: 30.h,
              ),
              buildProfileDetailsTile(),
              SizedBox(
                height: 30.h,
              ),
              buildButton(context),
              SizedBox(
                height: 20.h,
              ),
              buildAlreadyaMemberText()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(labels, Icon textfieldicon) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: textfieldicon,
          labelText: labels,
          //hintText: "Full Name",
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
            // borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: AppColors.mainGreen),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }

  buildLoginDetailsTile() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Login Details',
            style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.mainGreen,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20.h,
          ),
          buildTextFormField(
              'Enter your email or phone number ',
              Icon(
                Icons.email_sharp,
                size: 20.sp,
              )),
          SizedBox(
            height: 20.h,
          ),
          buildTextFormField(
              'Create new password',
              Icon(
                Icons.vpn_key,
                size: 20.sp,
              )),
          SizedBox(
            height: 20.h,
          ),
          buildTextFormField(
              'Confirm password',
              Icon(
                Icons.vpn_key,
                size: 20.sp,
              )),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  buildProfileDetailsTile() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Profile Details',
            style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.mainGreen,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20.h,
          ),
          buildTextFormField(
              'Username',
              Icon(
                Icons.person,
                size: 20.sp,
              )),
          SizedBox(
            height: 20.h,
          ),
          buildTextFormField(
              'Phone Number',
              Icon(
                Icons.phone_in_talk_rounded,
                size: 20.sp,
              )),
          SizedBox(
            height: 20.h,
          ),
          buildTextFormField(
              'City',
              Icon(
                Icons.location_city,
                size: 20.sp,
              )),
          SizedBox(
            height: 20.h,
          ),
          buildTextFormField(
              'District',
              Icon(
                Icons.location_on,
                size: 20.sp,
              )),
          SizedBox(
            height: 20.h,
          ),
          buildTextFormField(
              'State',
              Icon(
                Icons.home,
                size: 20.sp,
              )),
          SizedBox(
            height: 20.h,
          ),
          buildTextFormField(
              'Country',
              Icon(
                Icons.location_city,
                size: 20.sp,
              )),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  buildButton(context) {
    return SizedBox(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Submit',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(135, 194, 65, 1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }

  buildAlreadyaMemberText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already a member?',
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(0, 0, 0, 0.5)),
        ),
        TextButton(
            onPressed: () {
              Get.to(const LoginPage());
            },
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainGreen,
                  decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
