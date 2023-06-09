import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/get.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/utils/http_request.dart';

class CustomerApi extends HttpRequest {
  Future<Customer> relatedPersonList(String id) async {
    var res = await get('/customerRelatedPerson/list/$id');
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  createRelatedPerson(User data) async {
    var res = await post("/customerRelatedPerson",
        data: data.toJson(), handler: true);
    return res;
  }

  accountGet(String id) async {
    var res = await get("/account/$id", handler: true);
    return Get.fromJson(res as Map<String, dynamic>);
  }

  Future<Customer> bankAccountList(String id) async {
    var res = await get("/customerAccount/list/$id", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  createBankAccount(Customer data) async {
    var res = await post("/customerAccount/create",
        data: data.toJson(), handler: true);
    return res;
  }

  customerAddress(Customer data) async {
    var res = await post('/customerAddress/create',
        data: data.toJson(), handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Customer> addressList(String id) async {
    var res = await get("/customerAddress/list/$id", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  pay(Customer data) async {
    var res = await post("/payment/create", data: data.toJson(), handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Customer> customerGet(String id) async {
    var res = await get('/customer/$id', handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Customer> profileUpdate(String id, Customer data) async {
    var res = await put("/customer/$id", data: data.toJson(), handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }
}
