import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/password_reset_view_body.dart';

class PasswordResetView extends StatelessWidget {
  const PasswordResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password reset')),
      body: PasswordResetViewBody(),
    );
  }
}
