import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_auth_selection_button.dart';

class SignUpWithGoogleButton extends StatelessWidget {
  const SignUpWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAutthSelectionButton(
      onPress: () => GoRouter.of(context).goNamed(AppRouter.kSignUpWithGoogle),
      icon: FontAwesomeIcons.google,
      title: 'Continue with Google',
    );
  }
}
