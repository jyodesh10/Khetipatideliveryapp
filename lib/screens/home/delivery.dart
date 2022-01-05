import 'package:deliveryapp/constant/api.dart';
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

class Delivery extends GetView<DashboardController> {
  final DashboardController controller = Get.put(DashboardController());
  // late Future<Dashboarddetails> futureAlbum;

  Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      // bottomNavigationBar: CustomNav(),
      appBar: buildAppbar(Icons.arrow_back_ios_new_sharp, 'Khetipati'),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchDashboardDetails(),
        color: AppColors.textGreen,
        backgroundColor: AppColors.mainGreen,
        child: SingleChildScrollView(
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
      ),
    );
  }

  buildProfileTop() {
    var user = controller.dashboarddetail.value.user;
    var profile = controller.profiledata.value.data;
    return
        // Obx(() =>
        Container(
      //height: 283,
      width: double.infinity,
      padding: EdgeInsets.only(top: getHeight(35), bottom: getHeight(16)),
      color: AppColors.mainGreen,
      child: Column(
        children: [
          Obx(
            () => controller.isloading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.textGreen,
                    ),
                  )
                : CircleAvatar(
                    radius: 62,
                    backgroundColor: Colors.white,
                    child: user?.image != null
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                Url.base + '/' + user!.image.toString(),
                                scale: 100),
                            radius: 60,
                          )
                        : Container(),
                  ),
          ),

          SizedBox(
            height: getHeight(10),
          ),
          Obx(() => Text(
                // controller.dashboarddetail.elementAt(1).user!.firstname.toString(),
                controller.isloading.value
                    ? "Loading..."
                    : "${user?.firstname}",
                style: robototitleStyle.copyWith(
                    fontSize: getFont(23),
                    color: AppColors.textGreen,
                    fontWeight: FontWeight.w700),
              )),
          Text(
            "MangalBazaar,Lalitpur",
            style: archivotitleStyle.copyWith(
                fontSize: getFont(14),
                color: AppColors.textGreen,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: getHeight(22),
          ),
          // Obx(() => Text(controller.isloading.value.toString())),
          GestureDetector(
            onTap: () {
              Get.to(() => const DeliveryEditProfile());
              // controller.isloading.value = true;
              // controller.dispose();
              controller.fetchDashboardDetails();
              print(controller.dashboarddetail.value.user?.image);
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
      // )
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
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(18), vertical: getHeight(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
    var user = controller.dashboarddetail.value.user;
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
            Obx(() => controller.isloading.value
                ? const SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: getHeight(19),
                      ),
                      divider(),
                      SizedBox(
                        height: getHeight(14),
                      ),
                      buildPersonalInfo('Name',
                          controller.dashboarddetail.value.user?.firstname),
                      SizedBox(
                        height: getHeight(29),
                      ),
                      buildPersonalInfo('Address', 'KTm'),
                      SizedBox(
                        height: getHeight(29),
                      ),
                      buildPersonalInfo('Phone No.',
                          "${controller.dashboarddetail.value.user?.phone}"),
                      SizedBox(
                        height: getHeight(29),
                      ),
                      buildPersonalInfo('Email',
                          "${controller.dashboarddetail.value.user?.email}"),
                      SizedBox(
                        height: getHeight(20),
                      ),
                    ],
                  ))
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
              Get.offAll(() => LoginPage());
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
}
