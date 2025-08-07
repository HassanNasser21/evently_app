import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils {
  static void showsuccessmessage(String message)  =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: AppTheme.white,
        fontSize: 16.0
    );
    static void showerrormessage(String? message) =>
      Fluttertoast.showToast(
        msg: message??"something went wrong",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: AppTheme.red,
        textColor: AppTheme.white,
        fontSize: 16.0
    );
    

}