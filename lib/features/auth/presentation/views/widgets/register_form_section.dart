import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/validator.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class RegisterFormSection extends StatelessWidget {
  const RegisterFormSection({super.key, required this.cubit});

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: cubit.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text('Join Us', style: AppFontstyle.fontStyle30),
            Gap(30),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              controller: cubit.userNameController,
              prefixIcon: Icon(FontAwesomeIcons.user),
              hintText: 'User name',
            ),
            CustomTextFormField(
              validator: (value) {
                return checkEmailValidator(value);
              },
              keyboardType: TextInputType.emailAddress,
              controller: cubit.registerEmailController,
              prefixIcon: Icon(Icons.email_outlined),
              hintText: 'Email address',
            ),
            CusotmPasswordTextFormField(
              controller: cubit.registerPasswordController,
            ),
          ],
        ),
      ),
    );
  }
}
