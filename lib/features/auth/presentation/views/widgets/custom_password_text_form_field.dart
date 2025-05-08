import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/core/utils/validator.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class CusotmPasswordTextFormField extends StatefulWidget {
  const CusotmPasswordTextFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<CusotmPasswordTextFormField> createState() =>
      _CusotmPasswordTextFormFieldState();
}

class _CusotmPasswordTextFormFieldState
    extends State<CusotmPasswordTextFormField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      suffixIcon: GestureDetector(
        onTap: () {
          isVisible = !isVisible;
          setState(() {});
        },
        child: Icon(
          isVisible ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
        ),
      ),
      isVisible: isVisible,
      validator: (value) => checkPasswordValidator(value),
      keyboardType: TextInputType.name,
      controller: widget.controller,
      prefixIcon: Icon(Icons.lock_outline),
      hintText: 'Password',
    );
  }
}
