import 'package:flutter/material.dart';

class UtilsBkash {
  UtilsBkash._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static void showSnackBar({required String message}) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
