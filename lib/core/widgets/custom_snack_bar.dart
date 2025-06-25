import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

abstract class CustomSnackBar {
  //---------ForSuccess Messages
  static successSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: AppFontstyle.normal20,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  static confrimEmailSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: AppFontstyle.normal20,
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }

  //-----------for error Messages
  static errorSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: AppFontstyle.normal20,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
