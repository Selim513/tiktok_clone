import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/validator.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class RegisterFormSection extends StatelessWidget {
  const RegisterFormSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Text('Join Us', style: AppFontstyle.bold30),
          const Gap(30),
          CustomTextFormField(
            keyboardType: TextInputType.name,
            controller: nameController,
            prefixIcon: const Icon(FontAwesomeIcons.user),
            hintText: 'User name',
          ),
          CustomTextFormField(
            validator: (value) {
              return checkEmailValidator(value);
            },
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: 'Email address',
          ),
          CusotmPasswordTextFormField(controller: passwordController),
        ],
      ),
    );
  }
}
