import 'package:deliveryapp/constant/api.dart';
import 'package:deliveryapp/models/user.dart';
import 'package:deliveryapp/utils/snackbar.dart';
import 'package:get/get.dart';

class UserToken {
  String token = "";

  // set setToken(value) => token = value;
  get getToken => token;

  setToken(body) {
    token = body;
  }
}

class UserRepo extends GetConnect {
  // static const base = "http://192.168.10.67:8080/";
  static const login = Url.base + "userapi/login";

  ///register

  ///login
  loginWithEmailandPassword(String email, String password) async {
    var body = {"email": email, "password": password};

    try {
      var response = await post(login, body);
      var user = response.body;
      if (user != null) {
        User currentuser = User.fromJson(user["user"]);
        var token = user["token"];

        return [
          currentuser,
          token,
        ];
      } else {
        getSnackbar(message: 'error login');
      }
    } on Exception catch (e) {
      // print(e);
    }
  }

  ///get user info

}

final userrepo = UserRepo();
