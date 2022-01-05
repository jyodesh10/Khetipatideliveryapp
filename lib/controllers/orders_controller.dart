import 'package:deliveryapp/controllers/auth_controller.dart';
import 'package:deliveryapp/models/orders.dart';
import 'package:deliveryapp/services/orders_services.dart';
import 'package:deliveryapp/utils/snackbar.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  static OrdersController instance = Get.find();

  var ordersCompletedList = <OrdersModel>[].obs;
  var isLoading = true.obs;

  getOrdersCompleted() async {
    try {
      isLoading(true);
      var data =
          await OrdersApi().getOrdersCompleted(authController.token.value);

      if (data != null) {
        var ordersList = data['data'];
        ordersCompletedList.clear();
        ordersList.forEach((v) {
          ordersCompletedList.add(OrdersModel.fromJson(v));
        });
      } else {
        getSnackbar(message: "Error fetching data");
      }
    } finally {
      // TODO
      isLoading(false);
    }
  }
}
