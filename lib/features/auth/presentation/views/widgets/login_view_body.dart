import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: [
          Text('Welcome Back!', style: AppFontstyle.fontStyle30),
          Gap(10),

          CustomTextFormField(hintText: 'Email'),
          CustomTextFormField(hintText: 'Password'),
          Gap(10),
          CustomElevatedButton(
            widget: Text('Login', style: AppFontstyle.fontStyle20),
            onPress: () {
              GoRouter.of(context).goNamed(AppRouter.kHome);
            },
          ),
        ],
      ),
    );
  }
}
