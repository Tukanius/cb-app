import 'package:flutter/cupertino.dart';

class ListenController extends ChangeNotifier {
  String? value;

  ListenController();

  changeVariable(String value) {
    this.value = value;
    notifyListeners();
  }
}
