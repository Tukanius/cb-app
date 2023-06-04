import 'package:bank_core/models/customer_related_person.dart';
import '../models/user.dart';
import '../utils/http_request.dart';

class CustomerApi extends HttpRequest {
  Future<User> me(bool handler) async {
    print('==============RES===========');
    var res = await get('/customer/getUserId/:id', handler: handler);
    print(res);
    print('==============RES===========');
    return User.fromJson(res as Map<String, dynamic>);
  }
}
