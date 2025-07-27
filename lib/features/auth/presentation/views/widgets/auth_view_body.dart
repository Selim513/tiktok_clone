import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/features/auth/data/data_source/google_auth_remote_data_source.dart';
import 'package:tiktok_clone/features/auth/data/repo/google_auth_repo_impl.dart';
import 'package:tiktok_clone/features/auth/domain/use_cases/google_auth_use_case.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth_bloc/google_auth_bloc.dart';
import 'package:tiktok_clone/features/auth/presentation/views/sign_up_with_google.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_login_navigator_section.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/reqgister_with_email_button.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.sp,
          children: [
            const Spacer(),
            Text('Sign up for TikTok', style: AppFontstyle.bold30),
            const ReqgisterWithEmailButton(),
            BlocProvider(
              create:
                  (context) => GoogleAuthBloc(
                    GoogleAuthUseCase(
                      GoogleAuthRepoImpl(GoogleAuthRemoteDataSourceImpl()),
                    ),
                  ),
              child: const GoogleAuthBlocViewBody(),
            ),
            const Spacer(),
            const CustomLoginNavigatorSection(),
          ],
        ),
      ),
    );
  }
}
