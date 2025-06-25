import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_color.dart';

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({
    super.key,
    required this.title,
    required this.buttonName,
    this.onPressd,
  });
  final String title;
  final String buttonName;
  final void Function()? onPressd;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: AppFontstyle.normal20.copyWith(fontSize: 17)),
        TextButton(
          onPressed: onPressd,
          child: Text(
            buttonName,

            style: AppFontstyle.bold30.copyWith(
              fontSize: 17,
              color: AppColors.redColor,
            ),
          ),
        ),
      ],
    );
  }
}
