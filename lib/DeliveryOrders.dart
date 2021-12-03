import 'package:deliveryapp/constant/colors.dart';
import 'package:deliveryapp/constant/size_config.dart';
import 'package:flutter/material.dart';

class DeliveryOrders extends StatefulWidget {
  const DeliveryOrders({Key? key}) : super(key: key);

  @override
  _DeliveryOrdersState createState() => _DeliveryOrdersState();
}

class _DeliveryOrdersState extends State<DeliveryOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.mainGreen,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.mainGreen,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Orders',
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
                // height: 800,
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(20), vertical: getHeight(20)),
                decoration: BoxDecoration(
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
                      height: 30,
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

  OrderItems(wishlistItemImg, itemName, title, labelColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
      height: getHeight(113),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: getWidth(96),
                height: getHeight(71),
                child: Image.asset(
                  wishlistItemImg,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                        fontSize: getFont(16),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textblack),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Dropoff: Baneshwor,\nKathmandu',
                    style: TextStyle(
                        fontSize: getFont(12),
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.8)),
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
                height: 10,
              ),
              FittedBox(
                child: Text(
                  '23 hrs ago',
                  style: TextStyle(
                    fontSize: getFont(10),
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget labels(title, LabelColor) {
    return Container(
      //width: 50,
      // height: 22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: LabelColor),
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
          Container(
            // width: MediaQuery.of(context).size.width * 0.9,
            height: 40,
            child: TabBar(
              indicatorColor: AppColors.textGreen,
              indicatorSize: TabBarIndicatorSize.label,
              // indicatorWeight: 5,
              tabs: [
                Tab(
                  child: FittedBox(
                    child: Text(
                      'Orders Completed',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Tab(
                  child: FittedBox(
                    child: Text(
                      'Orders Pending',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            height: 800,
            //width: 350,
            child: TabBarView(
              physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                Column(
                  children: [
                    OrderItems('assets/images/items/grapes.png', 'Cherry',
                        'Delivered', Color.fromRGBO(135, 194, 65, 0.2)),
                    Divider(),
                    OrderItems('assets/images/items/melons.png', 'Meolon',
                        'Delivered', Color.fromRGBO(135, 194, 65, 0.2)),
                    Divider(),
                    OrderItems('assets/images/items/tomatoes.png', 'Tomatoes',
                        'Delivered', Color.fromRGBO(135, 194, 65, 0.2)),
                    Divider(),
                    OrderItems('assets/images/items/melons.png', 'melons',
                        'Delivered', Color.fromRGBO(135, 194, 65, 0.2)),
                    Divider(),
                    OrderItems('assets/images/items/grapes.png', 'Cherry',
                        'Delivered', Color.fromRGBO(135, 194, 65, 0.2)),
                  ],
                ),
                Column(
                  children: [
                    OrderItems('assets/images/items/melons.png', 'Melon',
                        'Pending', Color.fromRGBO(216, 47, 47, 0.2)),
                    Divider(),
                    OrderItems('assets/images/items/grapes.png', 'Cherry',
                        'Pending', Color.fromRGBO(216, 47, 47, 0.2)),
                    Divider(),
                    OrderItems('assets/images/items/melons.png', 'Melon',
                        'Pending', Color.fromRGBO(216, 47, 47, 0.2)),
                    Divider(),
                    OrderItems('assets/images/items/tomatoes.png', 'Tomatoes',
                        'Pending', Color.fromRGBO(216, 47, 47, 0.2)),
                    Divider(),
                    OrderItems('assets/images/items/melons.png', 'Melon',
                        'Pending', Color.fromRGBO(216, 47, 47, 0.2)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
