import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/core/utils/validator.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class EmailAuthView extends StatelessWidget {
  const EmailAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Tiktok')),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              'Join Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Gap(30),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              controller: userNameController,
              prefixIcon: Icon(FontAwesomeIcons.user),
              hintText: 'User name',
            ),
            CustomTextFormField(
              validator: (value) {
                return checkEmailValidator(value);
              },
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              prefixIcon: Icon(Icons.email_outlined),
              hintText: 'Email address',
            ),
            CusotmPasswordTextFormField(controller: passwordController),
            CustomElevatedButton(
              widget: Text(
                'Register Now',
                style: TextStyle(color: Colors.white),
              ),
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
