import 'dart:io';

import 'package:camera_app/ui/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StatusBarStyle { LIGHT, DARK }

class Util {
  static double screenWidth = 0.0;

  static void setStatusBarColor({StatusBarStyle style = StatusBarStyle.LIGHT}) {
    switch (style) {
      case StatusBarStyle.LIGHT:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        break;
      case StatusBarStyle.DARK:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        break;
      default:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
  }

  static Future<bool> saveKeyAndValueToFile(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  static Future<String> getValueFromKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) return prefs.getString(key);
    return "";
  }

  static void showErrorToast() {
    Fluttertoast.showToast(
        msg: DEFAULT_ERROR_MESSAGE,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showNoInternetToast() {
    Fluttertoast.showToast(
        msg: DEFAULT_NO_INTERNET_MESSAGE,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<bool> isConnectedToInternet() async {
   try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
      return false;
  }
    return true;
  }
}
