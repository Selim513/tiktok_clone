import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(body: LoginViewBody()),
    );
  }
}
