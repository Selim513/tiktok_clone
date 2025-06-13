import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/function_helper.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';

class AccountEditField extends StatelessWidget {
  const AccountEditField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.buttonOnTap,
    required this.buttonTitle,
  });
  final String title;
  final String hintText;
  final void Function()? buttonOnTap;
  final String buttonTitle;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppFontstyle.fontStyle20.copyWith(color: Colors.grey),
            ),
          ],
        ),
        TextField(
          controller: controller,

          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hint: Text(hintText, style: TextStyle(color: Colors.grey)),

            border: customOutLineBorders(),
            enabledBorder: customOutLineBorders(),
            focusedBorder: customOutLineBorders(),
          ),
        ),
        Gap(30),
        CustomElevatedButton(
          widget: Text(buttonTitle, style: AppFontstyle.fontStyle20),
          onPress: buttonOnTap,
        ),
      ],
    );
  }
}
