import 'package:bank_core/services/dialog.dart';
import 'package:flutter/material.dart';

import '../dialog_wrapper.dart';

class SuccessDialog {
  final BuildContext? context;
  final DialogService? dialogService;
  final Duration duration = const Duration(milliseconds: 1500);

  SuccessDialog({this.context, this.dialogService});

  void show(String message) {
    showDialog(
      context: context!,
      barrierDismissible: true,
      builder: (context) {
        return DialogWrapper(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 10.0),
              const Center(
                child: Icon(
                  Icons.check_circle,
                  size: 65.0,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 17.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        );
      },
    );
  }
}
