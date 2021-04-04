import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageService {
  static void showError(dynamic exception) {
    String message = exception?.toString() ?? 'An error has occured';
    if (message.contains(',')) {
      message = message.split(',')[1];
    } else if (message.contains(':')) {
      message = message.split(':')[1];
    }

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0);
  }
}
