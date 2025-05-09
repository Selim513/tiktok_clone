import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/email_auth_view_body.dart';

class EmailAuthView extends StatelessWidget {
  const EmailAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: EmailSignUpViewBody());
  }
}
