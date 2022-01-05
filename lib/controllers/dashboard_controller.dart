import 'package:deliveryapp/controllers/auth_controller.dart';
import 'package:deliveryapp/controllers/profile_controller.dart';
import 'package:deliveryapp/models/dashboard.dart';
import 'package:deliveryapp/models/edit_profile.dart';
import 'package:deliveryapp/services/daskboard_service.dart';
import 'package:deliveryapp/services/profile_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();

  // var dashboarddetails = <Dashboarddetails>[].obs;
  var dashboarddetail = Dashboarddetails().obs;
  // var details = <Dashboard>[].obs;
  var profiledata = EditProfile().obs;
  var isloading = true.obs;

  final count = 0.obs;

  @override
  void onInit() {
    fetchDashboardDetails();
    fetchDetails();

    super.onInit();
  }

  fetchDashboardDetails() async {
    //dashboarddetail.value = ;

    // var data =
    //     await DashboardApi().dashboardDetails(authController.token.value);
    // if (data != null) {
    //   var dashboarditems = data['data'];

    //   details.clear();

    //   dashboarditems.forEach((v) {
    //     details.add(Dashboard.fromJson(v));
    //   });
    // }

    try {
      isloading(true);
      var items =
          await DashboardApi().dashboardDetails(authController.token.value);
      print(items.toJson().toString());
      if (items != null) {
        dashboarddetail.value = items;
      }
    } finally {
      isloading(false);
    }
  }

  fetchDetails() async {
    var details =
        await ProfileApi().fetchProfiledata(authController.token.value);

    if (details != null) {
      profiledata.value = details;
    }
    print(profiledata.toJson().toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

var data = {
  "status": "success",
  "message": "Successfully sent",
  "data": {
    "dashboarddetails": {
      "user": {
        "firstname": "admin",
        "lastname": "admin",
        "email": "admin@gmail.com",
        "phone": "9841463556",
        "image": null
      },
      "totalorderscompleted": 0,
      "totalorderspending": 0,
      "earnings": 0
    }
  }
};
