import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/password_reset_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change password')),
      body: const PasswordResetViewBody(),
    );
  }
}
