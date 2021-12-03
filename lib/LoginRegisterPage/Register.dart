import 'package:flutter/material.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/LoginRegisterPage/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Registration',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04,
                left: MediaQuery.of(context).size.width * 0.04),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Login Details',
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.mainGreen,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      StylishTextFormField(
                          'Enter your email or phone number ',
                          Icon(
                            Icons.email_sharp,
                            size: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      StylishTextFormField(
                          'Create new password',
                          Icon(
                            Icons.vpn_key,
                            size: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      StylishTextFormField(
                          'Confirm password',
                          Icon(
                            Icons.vpn_key,
                            size: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Profile Details',
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.mainGreen,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      StylishTextFormField(
                          'Username',
                          Icon(
                            Icons.person,
                            size: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      StylishTextFormField(
                          'Phone Number',
                          Icon(
                            Icons.phone_in_talk_rounded,
                            size: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      StylishTextFormField(
                          'City',
                          Icon(
                            Icons.location_city,
                            size: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      StylishTextFormField(
                          'District',
                          Icon(
                            Icons.location_on,
                            size: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      StylishTextFormField(
                          'State',
                          Icon(
                            Icons.home,
                            size: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      StylishTextFormField(
                          'Country',
                          Icon(
                            Icons.location_city,
                            size: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(135, 194, 65, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
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
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Login',
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
      ),
    );
  }

  Widget StylishTextFormField(Labels, Icon textfieldicon) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.04),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: textfieldicon,
            labelText: Labels,
            //hintText: "Full Name",
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
              // borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: AppColors.mainGreen),
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }
}
