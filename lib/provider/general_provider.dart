import 'package:bank_core/api/general-api.dart';
import 'package:bank_core/models/general.dart';
import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier {
  General general = General();
  static late BuildContext context;

  static setContext(BuildContext ctx) {
    context = ctx;
  }

  init(bool handler) async {
    general = await GeneralApi().init(handler);
    notifyListeners();
  }
}
