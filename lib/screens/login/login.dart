import 'package:deliveryapp/screens/home/delivery.dart';
import 'package:deliveryapp/screens/register/register.dart';
import 'package:deliveryapp/widgets/curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height > 500
                ? MediaQuery.of(context).size.height
                : 800,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: AppColors.mainGreen,
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Image.asset(
                          'assets/images/applogo.png',
                          width: 90,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.mainGreen),
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_sharp, size: 20.sp),
                              labelText: "Enter your email or phone number",
                              //hintText: "Full Name",
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: AppColors.mainGreen),
                                borderRadius: BorderRadius.circular(0),
                              )),
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.vpn_key_rounded,
                                size: 20.sp,
                              ),
                              labelText: "Enter your password",
                              //hintText: "Full Name",
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: AppColors.mainGreen),
                                borderRadius: BorderRadius.circular(0),
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.5)),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          height: 50.h,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(const Delivery());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(135, 194, 65, 1)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a member yet?',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(0, 0, 0, 0.5)),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(const RegisterPage());
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.mainGreen,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
