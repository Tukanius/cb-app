import 'package:bank_core/models/answer.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/models/contact.dart';
import 'package:bank_core/utils/http_request.dart';

class GeneralApi extends HttpRequest {
  init(bool hander) async {
    var res = await get('/general/init', handler: hander);
    return General.fromJson(res as Map<String, dynamic>);
  }

  faqList() async {
    var res = await get('/answer-question/list', handler: false);
    print(res);
    return Answer.fromJson(res as Map<String, dynamic>);
  }

  contactList() async {
    var res = await get('/contact-info/list', handler: false);
    print(res);
    return Contact.fromJson(res as Map<String, dynamic>);
  }
}
