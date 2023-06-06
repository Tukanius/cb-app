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

  Future<Result> bankAccountList(ResultArguments resultArguments) async {
    var res = await get("/customerAccount/list",
        data: resultArguments.toJson(), handler: true);
    return Result.fromJson(res, Customer.fromJson);
  }

  createBankAccount(Customer data) async {
    var res = await post("/customerAccount/create/",
        data: data.toJson(), handler: true);
    return res;
  }
}
