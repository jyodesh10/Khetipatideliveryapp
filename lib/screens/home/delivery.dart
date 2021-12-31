import 'package:deliveryapp/controllers/dashboard_controller.dart';
import 'package:deliveryapp/models/dashboard.dart';
import 'package:deliveryapp/screens/orders/delivery_orders.dart';
import 'package:deliveryapp/screens/earnings/my_earnings.dart';
import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:deliveryapp/screens/login/login.dart';
import 'package:deliveryapp/widgets/appbar.dart';
import 'package:deliveryapp/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import '../edit_profile/delivery_edit_profile.dart';

class Delivery extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  late Future<Dashboarddetails> futureAlbum;

  Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppbar(null, 'Khetipati'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProfileTop(),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 815,
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(20), vertical: getHeight(22)),

              decoration: const BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  buildDeliveryProfileMenu(),
                  buildDeliveryPersonalInfoCard(context),
                  SizedBox(
                    height: getHeight(20),
                  ),
                  logoutAndSwitchAccTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  profileOptions(optionIcon, optionName, subvalue, String? value) {
    return Container(
      width: getWidth(140),
      height: getHeight(57),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(191, 191, 191, 0.6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: getWidth(10),
          ),
          Image.asset(
            optionIcon,
            height: 20,
            // color: AppColors.mainGreen,
          ),
          SizedBox(
            width: getWidth(12),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    subvalue,
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(11),
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGreen),
                  ),
                  SizedBox(
                    width: getWidth(5),
                  ),
                  Text(
                    value!,
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(15),
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGreen),
                  )
                ],
              ),
              Text(
                optionName,
                style: archivotitleStyle.copyWith(
                    fontSize: getFont(11),
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
          SizedBox(
            width: getWidth(10),
          ),
        ],
      ),
    );
  }

  buildDeliveryProfileMenu() {
    // final DashboardController controller = Get.put(DashboardController());
    //var details = Dashboarddetails();
    return Obx(
      () =>
          // controller.isloading.isFalse
          //     ? SizedBox(
          //         height: getHeight(200),
          //         child: const Center(
          //           child: Text('No data'),
          //         ),
          //       )
          //     :
          Container(
        //  width: MediaQuery.of(context).size.width,
        // height: 170,
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(18), vertical: getHeight(20)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.035,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    Get.to(const MyEarnings());
                  },
                  child: profileOptions(
                      'assets/icons/myEarnings.png',
                      'My Earnings',
                      'Rs',
                      '${controller.dashboarddetail.value.earnings}'),
                ),
                SizedBox(
                  width: getWidth(13),
                ),
                InkWell(
                  onTap: () {
                    Get.to(DeliveryOrders());
                  },
                  child: profileOptions(
                      'assets/icons/checked.png',
                      'Orders Completed',
                      '',
                      '${controller.dashboarddetail.value.totalorderscompleted}'),
                )
              ],
            ),
            SizedBox(
              height: getHeight(13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(DeliveryOrders());
                  },
                  child: profileOptions(
                      'assets/icons/pending.png',
                      'Orders Pending',
                      '',
                      '${controller.dashboarddetail.value.totalorderspending}'),
                ),
                SizedBox(
                  width: getWidth(13),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const MyEarnings());
                  },
                  child: profileOptions('assets/icons/withdrawn.png',
                      'Amount Withdrawn', 'Rs', '100'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildDeliveryPersonalInfoCard(context) {
    // var personalinfo = User();
    var user = controller.dashboarddetail.value.user!;
    return Container(
        margin: EdgeInsets.only(top: getHeight(22)),
        padding: EdgeInsets.only(top: getHeight(18)),
        width: double.infinity,
        //height: getHeight(271),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Personal Information',
              style: archivotitleStyle.copyWith(
                  color: Colors.black,
                  fontSize: getFont(18),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: getHeight(19),
            ),
            divider(),
            SizedBox(
              height: getHeight(14),
            ),
            buildPersonalInfo('Name',
                '${user.firstname} ${controller.dashboarddetail.value.user?.lastname}'),
            SizedBox(
              height: getHeight(29),
            ),
            buildPersonalInfo('Address', 'KTm'),
            SizedBox(
              height: getHeight(29),
            ),
            buildPersonalInfo(
                'Phone No.', "${controller.dashboarddetail.value.user?.phone}"),
            SizedBox(
              height: getHeight(29),
            ),
            buildPersonalInfo(
                'Email', "${controller.dashboarddetail.value.user?.email}"),
            SizedBox(
              height: getHeight(20),
            ),
          ],
        ));
  }

  buildPersonalInfo(options, answers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(
              left: getWidth(26),
            ),
            child: Text(options,
                style: archivotitleStyle.copyWith(
                    color: Colors.black,
                    fontSize: getFont(16),
                    fontWeight: FontWeight.w400)),
          ),
        ),
        SizedBox(width: getWidth(30)),
        Expanded(
          flex: 3,
          child: Text(
            answers,
            style: archivotitleStyle.copyWith(
                color: Colors.black,
                fontSize: getFont(16),
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  logoutAndSwitchAccTile() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: getHeight(18)),
      width: double.infinity,
      // height: getHeight(111),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: getWidth(20),
              ),
              Image.asset(
                'assets/icons/switchacc.png',
                height: 20,
              ),
              SizedBox(
                width: getWidth(20),
              ),
              Text(
                'Switch to other account',
                style: TextStyle(
                    fontSize: getFont(14),
                    fontWeight: FontWeight.w400,
                    color: AppColors.textblack),
              )
            ],
          ),
          SizedBox(height: getHeight(18)),
          divider(),
          SizedBox(height: getHeight(18)),
          InkWell(
            onTap: () {
              Get.to(() => LoginPage());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getWidth(20),
                ),
                Image.asset(
                  'assets/icons/logout.png',
                  height: 20,
                ),
                SizedBox(
                  width: getWidth(20),
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: getFont(14), fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildProfileTop() {
    var user = controller.dashboarddetail.value.user!;
    return Container(
      //height: 283,
      width: double.infinity,
      padding: EdgeInsets.only(top: getHeight(35), bottom: getHeight(16)),
      color: AppColors.mainGreen,
      child: Column(
        children: [
          Image.asset(
            // '${controller.dashboarddetail.value.user?.image}'
            'assets/images/profile.png',
            height: getHeight(135),
            width: getWidth(135),
          ),
          SizedBox(
            height: getHeight(10),
          ),
          Text(
            // controller.dashboarddetail.elementAt(1).user!.firstname.toString(),
            "${user.firstname} ${controller.dashboarddetail.value.user!.lastname}",
            style: robototitleStyle.copyWith(
                fontSize: getFont(23),
                color: AppColors.textGreen,
                fontWeight: FontWeight.w700),
          ),
          Text(
            "Mangalbazar, Lalitpur",
            style: archivotitleStyle.copyWith(
                fontSize: getFont(14),
                color: AppColors.textGreen,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: getHeight(22),
          ),
          GestureDetector(
            onTap: () {
              Get.to(DeliveryEditProfile());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromRGBO(255, 255, 255, 0.5)),
              child: Text(
                'Edit',
                style: archivotitleStyle.copyWith(
                    fontSize: getFont(15),
                    color: const Color.fromRGBO(2, 95, 51, 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
