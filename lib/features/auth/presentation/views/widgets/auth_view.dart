import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/auth/presentation/views/email_auth_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_auth_selection_button.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Spacer(),
              Text(
                'Sign up for TikTok',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              CustomAutthSelectionButton(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailAuthView()),
                  );
                },
                icon: Icons.email,
                title: 'Continue with Email',
              ),
              CustomAutthSelectionButton(
                icon: FontAwesomeIcons.google,
                title: 'Continue with Google',
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
