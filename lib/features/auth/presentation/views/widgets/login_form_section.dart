import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/validator.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key, required this.cubit});

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: [
          Text('Welcome Back!', style: AppFontstyle.fontStyle30),
          Gap(10),

          CustomTextFormField(
            hintText: 'Email',
            controller: cubit.loginEmailController,
            validator: (value) => checkEmailValidator(value),
          ),
          CustomTextFormField(
            hintText: 'Password',
            controller: cubit.loginPasswordController,
            isVisible: true,
            validator: (value) => checkPasswordValidator(value),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
