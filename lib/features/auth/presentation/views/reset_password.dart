import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/validator.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Center(
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('Email address', style: AppFontstyle.normal20),
              CustomTextFormField(
                hintText: 'Email',
                controller: emailController,
                validator: (value) => checkEmailValidator(value),
                prefixIcon: const Icon(Icons.person),
              ),
              Gap(40.sp),
              CustomElevatedButton(
                onPress: () async {

                  Constant.supabase.auth.resetPasswordForEmail(
                    emailController.text,
                  );
                }, 
                widget: Text('Reset now', style: AppFontstyle.medium25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
