import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/register_with_email_view_body.dart';

class EmailAuthView extends StatelessWidget {
  const EmailAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
        child: RegisterWithEmailViewBody(),
      ),
    );
  }
}
