import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;
import 'package:deliveryapp/screens/orders/test/test_model.dart';

class Apiservice extends GetConnect {
  static fetchproducts() async {
    var response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    }
  }
}
