import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tiktok')),

      body: const AuthViewBody(),
    );
  }
}
