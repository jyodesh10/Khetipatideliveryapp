import 'package:deliveryapp/screens/orders/test/api_service.dart';
import 'package:deliveryapp/screens/orders/test/test_model.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await Apiservice.fetchproducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
