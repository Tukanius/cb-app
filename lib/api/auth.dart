import 'package:bank_core/models/customer_account.dart';
import 'package:bank_core/models/customer_related_person.dart';

import '../models/user.dart';
import '../provider/user_provider.dart';
import '../utils/http_request.dart';

class AuthApi extends HttpRequest {
  Future<User> login(User user) async {
    var res = await post('/login', data: user.toJson(), handler: true);
    UserProvider().setAccessToken(res["accessToken"]);
    return User.fromJson(res as Map<String, dynamic>);
  }

  Future<User> me(bool handler) async {
    var res = await get('/auth/me', handler: handler);
    return User.fromJson(res as Map<String, dynamic>);
  }

  logout() async {
    await get('/logout');
  }

  Future<User> register(User user) async {
    var res = await post('/mobile/customer/create', data: user.toJson());

    return User.fromJson(res as Map<String, dynamic>);
  }

  Future<CustomerAccount> bankAccount(CustomerAccount account) async {
    var res = await post('/Customer_account/create', data: account.toJson());
    return CustomerAccount.fromJson(res as Map<String, dynamic>);
  }

  Future<User> relatedPerson(CustomerRelated customerRelated) async {
    var res =
        await post('/Customer_related_person', data: customerRelated.toJson());
    return User.fromJson(res as Map<String, dynamic>);
  }

  Future<User> isOriginal(User user) async {
    var res = await post('/Customer_account/create', data: user.toJson());
    return User.fromJson(res as Map<String, dynamic>);
  }

  Future<void> socialLogin(User data) async {
    var res = await post('/login', data: data.toJson());
    UserProvider().setAccessToken(res["accessToken"]);
    UserProvider().setSessionScope(res["sessionScope"]);
  }
}
