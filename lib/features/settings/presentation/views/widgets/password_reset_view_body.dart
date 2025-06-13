import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/account_edit_field.dart';

class PasswordResetViewBody extends StatefulWidget {
  const PasswordResetViewBody({super.key});

  @override
  State<PasswordResetViewBody> createState() => _PasswordResetViewBodyState();
}

class _PasswordResetViewBodyState extends State<PasswordResetViewBody> {
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: AccountEditField(
        controller: passwordController,
        title: 'New password',
        hintText: 'password',
        buttonTitle: 'Reset password',
        buttonOnTap: () async {
          var user = Supabase.instance.client.auth;
          await user.updateUser(
            UserAttributes(password: passwordController.text),
          );
        },
      ),
    );
  }
}
