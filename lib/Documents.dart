import 'package:deliveryapp/constant/colors.dart';
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
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Text(
                        'Document Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                        child: Column(
                      children: [
                        StylishTextFormField('Document Type'),
                        SizedBox(
                          height: 30,
                        ),
                        StylishTextFormField('Document Photo'),
                        SizedBox(
                          height: 30,
                        ),
                        StylishTextFormField('Document Number'),
                        SizedBox(
                          height: 30,
                        ),
                        StylishTextFormField('Issued date'),
                        SizedBox(
                          height: 30,
                        ),
                        StylishTextFormField('Issued district'),
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
                    ))
                  ],
                ))
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
}
