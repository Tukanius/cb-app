import 'package:bank_core/models/result.dart';
import 'package:bank_core/utils/http_request.dart';
import '../models/user.dart';
import '../models/get.dart';

class AuthApi extends HttpRequest {
  login(User user) async {
    var res = await post('/auth/login', data: user.toJson(), handler: true);
    return User.fromJson(res as Map<String, dynamic>);
  }

  me(bool handler) async {
    var res = await get('/auth/me', handler: handler);
    return User.fromJson(res as Map<String, dynamic>);
  }

  register(User user) async {
    var res =
        await post("/customer/create", data: user.toJson(), handler: true);
    return User.fromJson(res as Map<String, dynamic>);
  }

  accountGet(String id) async {
    var res = await get("/account/$id", handler: true);
    return Get.fromJson(res as Map<String, dynamic>);
  }

  checkPassword(User data) async {
    var res = post("/auth/checkPassword", data: data.toJson(), handler: true);
    return res;
  }
}
