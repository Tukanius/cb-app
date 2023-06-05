import 'package:bank_core/models/general.dart';
import 'package:bank_core/utils/http_request.dart';

class GeneralApi extends HttpRequest {
  init(bool hander) async {
    var res = await get('/general/init', handler: hander);
    return General.fromJson(res as Map<String, dynamic>);
  }
}
