import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/core/utils/function_helper.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.readOnly = false,
    this.keyboardType,
    this.suffixIcon,
    this.isVisible = false,
    this.validator,
  });
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool readOnly;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool isVisible;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isVisible,
      keyboardType: keyboardType,
      readOnly: readOnly,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
        hintText: hintText,
        // suffixIcon: suffixIcon,
        border: customOutLineBorders(),
        errorBorder: customOutLineBorders(),
        enabledBorder: customOutLineBorders(),
        focusedBorder: customOutLineBorders(),
      ),
    );
  }
}
