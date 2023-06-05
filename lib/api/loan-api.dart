import 'package:bank_core/models/loan.dart';
import 'package:bank_core/utils/http_request.dart';

class LoanApi extends HttpRequest {
  createLoan(Loan data) async {
    var res = await post("/Loan/create", data: data.toJson(), handler: true);
    return Loan.fromJson(res as Map<String, dynamic>);
  }
}
