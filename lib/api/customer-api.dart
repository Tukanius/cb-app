import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/get.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/utils/http_request.dart';

class CustomerApi extends HttpRequest {
  Future<Result> relatedPersonList(ResultArguments resultArguments) async {
    var res = await get('/customer-related-person/list',
        data: resultArguments.toJson());
    return Result.fromJson(res, Customer.fromJson);
  }

  createRelatedPerson(User data) async {
    var res = await post("/customer-related-person/create",
        data: data.toJson(), handler: true);
    return res;
  }

  accountGet(String id) async {
    var res = await get("/account/$id", handler: true);
    return Get.fromJson(res as Map<String, dynamic>);
  }

  Future<Customer> bankAccountList() async {
    var res = await get("/customer-account/list", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  createBankAccount(Customer data) async {
    var res = await post("/customer-account/create",
        data: data.toJson(), handler: true);
    return res;
  }

  customerAddress(Customer data) async {
    var res = await post('/customer-address/create',
        data: data.toJson(), handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Customer> addressList() async {
    var res = await get("/customer-address/list", handler: true);
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

  Future<Customer> changeEmail(String id, Customer data) async {
    var res = await put("/customer/$id", data: data.toJson(), handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Customer> changePhone(String id, Customer data) async {
    var res = await put("/customer/$id", data: data.toJson(), handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }
}
