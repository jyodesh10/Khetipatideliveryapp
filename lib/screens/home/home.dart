import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:deliveryapp/controllers/home_controller.dart';
import 'package:deliveryapp/models/edit_profile.dart';
import 'package:deliveryapp/screens/earnings/my_earnings.dart';
import 'package:deliveryapp/screens/edit_profile/delivery_edit_profile.dart';
import 'package:deliveryapp/screens/home/delivery.dart';
import 'package:deliveryapp/screens/orders/delivery_orders.dart';
import 'package:deliveryapp/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Widget> tabs = [
  Delivery(),
  DeliveryOrders(),
  const MyEarnings(),
  DeliveryEditProfile()
];

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  // final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    //testing
    // controller.getOrder();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainGreen,

      ////bottom navigation
      bottomNavigationBar: CustomNav(),

      ///tab widgets
      body: buildTab(),

      ///cart button
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: InkWell(
        onTap: () {
          // Get.to(() => CartScreen());
        },
        child: Container(
            margin: EdgeInsets.only(top: getHeight(20)),
            padding: const EdgeInsets.all(10),
            width: getHeight(68),
            height: getHeight(68),
            decoration: BoxDecoration(
                color: AppColors.mainGrey,
                border: Border.all(width: 3.5, color: AppColors.mainGreen),
                borderRadius: BorderRadius.circular(40)),
            child: Image.asset(
              'assets/icons/cart.png',
              height: getHeight(20),
            )),
      ),
    );
  }

  buildTab() {
    return Obx(() => tabs[controller.selectedIndex]);
  }
}
