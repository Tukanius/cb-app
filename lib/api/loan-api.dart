import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/loan.dart';
import 'package:bank_core/models/qpay.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/utils/http_request.dart';

class LoanApi extends HttpRequest {
  createLoan(Loan data) async {
    var res = await post("/Loan/create", data: data.toJson(), handler: true);
    return Loan.fromJson(res as Map<String, dynamic>);
  }

  activeLoanGet(String id) async {
    var res = await get("/loan/loan-info/$id", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Customer> paidList(String id) async {
    var res = await get("/loan/loan-pay-back-paid/list/$id", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Result> loanSchedule(
      ResultArguments resultArguments, String id) async {
    var res = await get("/loan/loan-pay-back/list/$id",
        data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Customer.fromJson);
  }

  Future<Result> activeList(ResultArguments resultArguments, String id) async {
    var res = await get("/loan/active-loans/$id",
        data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Customer.fromJson);
  }

  Future<Customer> verify() async {
    var res = await get("/loan/verify", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  loanProduct(bool handler) async {
    var res = await get("/loan-product/list", handler: handler);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Result> transactionList(ResultArguments resultArguments) async {
    var res = await get('/transaction/list',
        data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Customer.fromJson);
  }

  Future<Customer> scoring() async {
    var res = await get('/loan/scoring', handler: true);
    return res;
  }

  Future<Qpay> qpayment(Qpay data) async {
    var res =
        await post('/qpay/auth/token', data: data.toJson(), handler: true);
    return Qpay.fromJson(res);
  }

  // Future<Qpay> qpay(Qpay transaction) async {
  //   var res = await post('/qpay/auth/token', data: transaction.toJson());
  //   return Qpay.fromJson(res);
  // }
}
