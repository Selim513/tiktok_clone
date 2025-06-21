import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/validator.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key, required this.loginEmailController, required this.loginPasswordController, required this.loginFormKey});

  final TextEditingController loginEmailController;
  final TextEditingController loginPasswordController;
  final GlobalKey<FormState> loginFormKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: [
          Text('Welcome Back!', style: AppFontstyle.fontStyle30),
          const Gap(10),

          CustomTextFormField(
            hintText: 'Email',
            controller: loginEmailController,
            validator: (value) => checkEmailValidator(value),
          ),
          CustomTextFormField(
            hintText: 'Password',
            controller: loginPasswordController,
            isVisible: true,
            validator: (value) => checkPasswordValidator(value),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
