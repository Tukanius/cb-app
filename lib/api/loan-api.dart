import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/loan.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/utils/http_request.dart';

class LoanApi extends HttpRequest {
  createLoan(Loan data) async {
    var res = await post("/Loan/create", data: data.toJson(), handler: true);
    return Loan.fromJson(res as Map<String, dynamic>);
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

  Future<Result> activeList(ResultArguments resultArguments, String id) async {
    var res =
        await get("/Loans/$id", data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Customer.fromJson);
  }

  Future<Customer> verify(String id) async {
    var res = await get("/loan/verify/$id", handler: true);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  loanProduct(bool handler) async {
    var res = await get("/loanProduct/list", handler: handler);
    return Customer.fromJson(res as Map<String, dynamic>);
  }

  Future<Result> transactionList(ResultArguments resultArguments) async {
    var res = await get('/transaction/list',
        data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Loan.fromJson);
  }
}
