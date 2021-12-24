import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:deliveryapp/screens/earnings/widgets/bottomsheet.dart';
import 'package:deliveryapp/screens/earnings/widgets/earnings_card.dart';
import 'package:deliveryapp/theme.dart';
import 'package:flutter/material.dart';

class MyEarnings extends StatefulWidget {
  const MyEarnings({Key? key}) : super(key: key);

  @override
  _MyEarningsState createState() => _MyEarningsState();
}

class _MyEarningsState extends State<MyEarnings> {
  bool withdrawn = true;

  void isWithdrawn() {
    setState(() {
      withdrawn = !withdrawn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildappBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: getWidth(27)),
        decoration: const BoxDecoration(
          color: AppColors.mainGrey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: withdrawn
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getHeight(22),
                    ),
                    buildEarningsCard(),
                    buildDate('Today'),
                    buildEarningsHistoryCard(
                        'Earned while Delivering from Shankhamul to Satdobato',
                        'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                        false),
                    buildDate('Yesterday'),
                    buildEarningsHistoryCard(
                        'Withdrawn Amount', 'Balance: 250.55', true),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    buildEarningsHistoryCard(
                        'Earned while Delivering from Shankhamul to Satdobato',
                        'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                        false),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    buildEarningsHistoryCard(
                        'Withdrawn Amount', 'Balance: 250.55', true),
                    buildDate('15th Aug. 2021'),
                    buildEarningsHistoryCard(
                        'Earned while Delivering from Shankhamul to Satdobato',
                        'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                        false),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    buildEarningsHistoryCard(
                        'Withdrawn Amount', 'Balance: 250.55', true),
                    SizedBox(
                      height: getHeight(15),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildEarningsCard(),
                    buildDate('Today'),
                    buildEarningsHistoryCard(
                        'Withdrawn Amount', 'Balance: 250.55', true),
                    buildDate('Yesterday'),
                    buildEarningsHistoryCard(
                        'Withdrawn Amount', 'Balance: 250.55', true),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    buildEarningsHistoryCard(
                        'Withdrawn Amount', 'Balance: 250.55', true),
                    buildDate('15th Aug. 2021'),
                    buildEarningsHistoryCard(
                        'Withdrawn Amount', 'Balance: 250.55', true),
                  ],
                ),
        ),
      ),
    );
  }

  buildEarningsCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: getHeight(76),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(135, 194, 65, 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rs.',
                  style: robototitleStyle.copyWith(
                      fontSize: getFont(20),
                      fontWeight: FontWeight.w700,
                      color: AppColors.textGreen),
                ),
                SizedBox(
                  width: getWidth(5),
                ),
                Text(
                  "200.0",
                  style: robototitleStyle.copyWith(
                      fontSize: getFont(25),
                      fontWeight: FontWeight.w700,
                      color: AppColors.textGreen),
                )
              ],
            ),
            Text(
              'Total Withdrawn',
              style: robototitleStyle.copyWith(
                  fontSize: getFont(12),
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGreen),
            )
          ],
        ),
      ),
    );
  }

  buildDate(date) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHeight(15)),
      child: Text(
        date,
        style: archivotitleStyle.copyWith(
            color: const Color.fromRGBO(0, 0, 0, 0.6),
            fontSize: getFont(14),
            fontWeight: FontWeight.w400),
      ),
    );
  }

  buildappBar() {
    return AppBar(
      toolbarHeight: getHeight(70),
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.mainGreen,
      centerTitle: true,
      elevation: 0,
      title: Text(
        'My Earnings',
        style: TextStyle(
            fontSize: getFont(22),
            color: AppColors.textGreen,
            fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_rounded,
            size: 20, color: AppColors.textGreen),
      ),
      actions: [
        InkWell(
          child: Container(
            height: 20,
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icons/earningsmenu.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          onTap: () {
            buildModalBottomSheet(context);
          },
        ),
      ],
    );
  }
}
