import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApplicationConstants {
  static ApplicationConstants? _instance;

  static ApplicationConstants get instance =>
      _instance ??= ApplicationConstants._init();

  ApplicationConstants._init();

  String get appName => "Pomodofocus";

  String get assetPath => 'assets/';
  String get imagesPath => '${assetPath}images/';
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade500,
      textColor: Colors.black,
      fontSize: 16.0);
}
