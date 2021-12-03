import 'package:deliveryapp/delivery.dart';
import 'package:flutter/material.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/LoginRegisterPage/Register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    color: AppColors.mainGreen,
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    // child: Container(
                    //   height: 10,
                    //   width: 10,
                    //   color: Colors.white,
                    // )

                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image.asset(
                        'assets/images/applogo.png',
                        width: 90,
                      ),
                    ),
                    // decoration: BoxDecoration(
                    //     color: AppColors.mainGreen,
                    //     borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(170),
                    //         bottomRight: Radius.circular(170),
                    //         ),
                    //         ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(20),
                    //     bottomRight: Radius.circular(20),
                    //     ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.1,
                        bottom: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.08,
                        left: MediaQuery.of(context).size.width * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: AppColors.mainGreen),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_sharp, size: 20),
                              labelText: "Enter your email or phone number",
                              //hintText: "Full Name",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: AppColors.mainGreen),
                                borderRadius: BorderRadius.circular(0),
                              )),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.vpn_key_rounded,
                                size: 20,
                              ),
                              labelText: "Enter your password",
                              //hintText: "Full Name",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Delivery()),
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(135, 194, 65, 1)),
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(0, 0, 0, 0.5)),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()),
                                  );
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.mainGreen,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
