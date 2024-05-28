// import 'dart:js';

import 'package:flutter/material.dart';

class AppUtils {
  static AppUtils sharedUtils = AppUtils();

  alert({required context,required title,required message}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'))
              ],
            ));
  }
}
