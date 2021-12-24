import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:deliveryapp/theme.dart';
import 'package:deliveryapp/widgets/appbar.dart';
import 'package:deliveryapp/widgets/divider.dart';
import 'package:flutter/material.dart';

class DeliveryOrders extends StatelessWidget {
  const DeliveryOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.mainGreen,
        appBar: buildAppbar(Icons.arrow_back_ios, 'Orders'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 800,
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(20), vertical: getHeight(20)),
                decoration: const BoxDecoration(
                  color: AppColors.mainGrey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    buildOrdersTab(),
                    SizedBox(
                      height: getHeight(30),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildOrderItemsTile(wishlistItemImg, itemName, title, labelColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
      height: getHeight(113),
      // width: getWidth(340),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: getWidth(96),
                height: getHeight(71),
                child: Image.asset(
                  wishlistItemImg,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: getWidth(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    itemName,
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(16),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textblack),
                  ),
                  SizedBox(
                    height: getHeight(5),
                  ),
                  Text(
                    'Dropoff: Baneshwor,\nKathmandu',
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(12),
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 0.8)),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              labels(title, labelColor),
              SizedBox(
                height: getHeight(10),
              ),
              Text(
                '23 hrs ago',
                style: archivotitleStyle.copyWith(
                  fontSize: getFont(10),
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  labels(title, labelColor) {
    return Container(
      //width: 50,
      // height: 22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: labelColor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.textGreen,
                fontSize: getFont(14),
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  buildOrdersTab() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            // width: MediaQuery.of(context).size.width * 0.9,
            height: getHeight(40),
            child:
                // Row(
                //   children: [Text(
                //     'Orders Completed'
                //   ),Text(
                //     'Orders Pending'
                //   )],
                // )

                TabBar(
              indicatorColor: AppColors.textGreen,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: archivotitleStyle.copyWith(
                  fontSize: getFont(14),
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500),
              unselectedLabelColor: Colors.black,
              labelColor: AppColors.textGreen,
              // indicatorWeight: 5,
              tabs: const [
                Tab(
                  text: 'Orders Completed',
                ),
                Tab(
                  text: 'Orders Pending',
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            height: 1000,
            //width: 350,
            child: TabBarView(
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                // ...List.generate(
                //     10,
                //     (index) => buildOrderItemsTile(
                //         'assets/images/items/grapes.png',
                //         'Cherry',
                //         'Delivered',
                //         const Color.fromRGBO(135, 194, 65, 0.2))),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return buildOrderItemsTile(
                        'assets/images/items/grapes.png',
                        'Cherry',
                        'Delivered',
                        const Color.fromRGBO(135, 194, 65, 0.2));
                  },
                  separatorBuilder: (context, index) {
                    return divider();
                  },
                ),

                ListView.separated(
                  shrinkWrap: false,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return buildOrderItemsTile(
                        'assets/images/items/melons.png',
                        'Melon',
                        'Pending',
                        const Color.fromRGBO(216, 47, 47, 0.2));
                  },
                  separatorBuilder: (context, index) {
                    return divider();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
