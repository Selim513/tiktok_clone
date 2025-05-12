import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

abstract class CustomSnackBar {
  static successSnackBar(
    BuildContext context, {
    required String message,
    bool isSuccess = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: AppFontstyle.fontStyle20,
        ),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }
}
