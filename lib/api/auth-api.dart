import 'package:bank_core/utils/http_request.dart';
import '../models/user.dart';

class AuthApi extends HttpRequest {
  login(User user) async {
    var res = await post('/auth/login', data: user.toJson(), handler: true);
    return User.fromJson(res as Map<String, dynamic>);
  }

  changePassword(User user) async {
    var res =
        await post('/password/change', data: user.toJson(), handler: true);
    return User.fromJson(res as Map<String, dynamic>);
  }

  me(bool handler) async {
    var res = await get('/auth/me', handler: handler);
    return User.fromJson(res as Map<String, dynamic>);
  }

  register(User user) async {
    var res = await post("/auth/register", data: user.toJson(), handler: true);
    return User.fromJson(res as Map<String, dynamic>);
  }

  checkPassword(User data) async {
    Map<String, dynamic> json = {};
    json['password'] = data.password;
    var res = await post("/auth/check-password", data: json);
    return res == true;
  }

  otpVerify(User data) async {
    Map<String, dynamic> json = {};
    json['otpCode'] = data.otpCode;
    json['otpMethod'] = data.otpMethod;
    var res = await post('/otp/verify', data: json, handler: true);
    return res;
  }

  forgot(User data) async {
    var res = await post('/auth/forgot', data: data.toJson());
    return User.fromJson(res);
  }

  getOtp() async {
    var res = await get('/otp/get?otpMethod=FORGOT', handler: true);
    return User.fromJson(res as Map<String, dynamic>);
  }
}
