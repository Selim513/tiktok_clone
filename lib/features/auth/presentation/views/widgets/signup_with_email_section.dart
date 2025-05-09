import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_auth_selection_button.dart';

class SignUpWithEmailButton extends StatelessWidget {
  const SignUpWithEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAutthSelectionButton(
      onPress: () => GoRouter.of(context).goNamed(AppRouter.kSignUpWithEmail),
      icon: Icons.email,
      title: 'Continue with Email',
    );
  }
}
