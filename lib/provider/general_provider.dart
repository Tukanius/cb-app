import 'package:flutter/material.dart';
import 'package:bank_core/models/general.dart';

import '../api/general.dart';

class GeneralProvider extends ChangeNotifier {
  General general = General();
  init(bool handler) async {
    general = await GeneralApi().init(handler);
  }
}
