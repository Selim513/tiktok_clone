import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth/google_auth_cubit.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth/google_state.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_login_navigator_section.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/signup_with_email_button.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/signup_with_google_button.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            SignUpWithEmailButton(),
            BlocListener<GoogleAuthCubit, GoogleAuthState>(
              listener: (context, state) {
                if (state is GoogleAuthSuccess) {
                  if (Supabase.instance.client.auth.currentUser == null) {
                    CustomSnackBar.successSnackBar(
                      context,
                      message: 'Errorrrrr',
                    );
                    print('Erorrrrrrrrrrrrr');
                  } else {
                    GoRouter.of(context).goNamed(AppRouter.kHome);
                  }
                }
              },
              child: SignUpWithGoogleButton(),
            ),
            Spacer(),
            CustomLoginNavigatorSection(),
          ],
        ),
      ),
    );
  }
}
