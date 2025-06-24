import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      
    ), body: const LoginViewBody());
  }
}
