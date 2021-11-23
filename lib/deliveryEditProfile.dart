import 'package:deliveryapp/Documents.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:flutter/material.dart';

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
              height: 228,
              width: MediaQuery.of(context).size.width,
              color: AppColors.mainGreen,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 33, bottom: 15),
                    child: Container(
                      child: Image.asset(
                        'assets/images/profile.png',
                        height: 135,
                        width: 135,
                      ),
                    ),
                  ),
                  Text(
                    "Change Profile Picture",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.green[900],
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 815,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Form(
                  child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  StylishTextFormField('Full Name'),
                  SizedBox(
                    height: 30,
                  ),
                  StylishTextFormField('Address'),
                  SizedBox(
                    height: 30,
                  ),
                  StylishTextFormField('Phone Number'),
                  SizedBox(
                    height: 30,
                  ),
                  StylishTextFormField('Email'),
                  SizedBox(
                    height: 30,
                  ),
                  StylishTextFormField('Date of Birth'),
                  SizedBox(
                    height: 30,
                  ),
                  StylishTextFormField('Gender'),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
                          color: AppColors.mainGrey,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Change Password',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                                color: Color.fromRGBO(147, 147, 147, 0.8),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditDocuments()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
                          color: AppColors.mainGrey,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Documents',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                                color: Color.fromRGBO(147, 147, 147, 0.8),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: RaisedButton(
                        color: AppColors.mainGreen,
                        onPressed: () {},
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget StylishTextFormField(Labels) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: Labels,
            //hintText: "Full Name",
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
              // borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(0),
            )),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'New Password must be different from current password.',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          StylishTextFormField('Current Password'),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          StylishTextFormField('New Password'),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Must be 8 characters long.',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          StylishTextFormField('Confirm Password'),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Must be 8 characters long.',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: ButtonTheme(
              minWidth: 200,
              height: 48,
              child: RaisedButton(
                color: AppColors.mainGreen,
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
    // Container(width: 414, height: 416, color: Colors.white);
  }
}
