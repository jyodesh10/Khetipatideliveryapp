import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  var index = 0.obs;
  get selectedIndex => index.value;

  updateIndex(int i) {
    index.value = i;
  }
}
