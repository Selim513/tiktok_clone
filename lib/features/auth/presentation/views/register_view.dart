import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/register_with_email_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const RegisterViewBody());
  }
}
