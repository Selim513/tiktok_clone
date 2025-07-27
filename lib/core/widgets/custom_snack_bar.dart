import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

abstract class CustomSnackBar {
  //---------ForSuccess Messages
  static successSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
        dismissDirection: DismissDirection.horizontal,
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
        duration: const Duration(seconds: 2),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
        dismissDirection: DismissDirection.horizontal,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: AppFontstyle.normal20,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  //-----------for error Messages
  static errorSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
        dismissDirection: DismissDirection.horizontal,
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
