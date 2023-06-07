import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/utils/http_request.dart';

class CustomerApi extends HttpRequest {
  Future<Result> relatedPersonList(ResultArguments resultArguments) async {
    var res =
        await get('/customerRelatedPerson', data: resultArguments.toJson());
    return Result.fromJson(res, Customer.fromJson);
  }

  createRelatedPerson(User data) async {
    var res = await post("/customerRelatedPerson/",
        data: data.toJson(), handler: true);
    return res;
  }

  Future<Customer> bankAccountList(String id) async {
    var res = await get("/customerAccount/list/$id", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  createBankAccount(Customer data) async {
    var res = await post("/customerAccount/create/",
        data: data.toJson(), handler: true);
    return res;
  }

  customerAddress(Customer data) async {
    var res = await post('/customerAddress/create',
        data: data.toJson(), handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Result> addressList(ResultArguments resultArguments) async {
    var res = await get("/customerAddress",
        data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Customer.fromJson);
  }

  Future<Result> activeList(ResultArguments resultArguments, String id) async {
    var res =
        await get("/Loans/$id", data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Customer.fromJson);
  }

  activeLoanGet(String id) async {
    var res = await get("/loanPayBack/$id", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Result> paidList(ResultArguments resultArguments, String id) async {
    var res = await get("/loanPayBackPaidList/$id",
        data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Customer.fromJson);
  }

  Future<Result> loanSchedule(
      ResultArguments resultArguments, String id) async {
    var res = await get("/loanPayBackList/$id",
        data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Customer.fromJson);
  }

  pay(Customer data) async {
    var res = await post("/payment/create", data: data.toJson(), handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Customer> verify(String id) async {
    var res = await get("/loan/verify/$id", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }
}
