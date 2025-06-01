import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_state.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/login_form_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocConsumer<LoginCubit, UserAuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CustomSnackBar.successSnackBar(context, message: state.succMessage);
            GoRouter.of(context).goNamed(AppRouter.kHome);
          } else if (state is LoginFailure) {
            CustomSnackBar.errorSnackBar(
              context,
              message: state.errMessage,
            
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();
          return Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginFormSection(cubit: cubit),
              state is LoginLoading
                  ? CircularProgressIndicator()
                  : CustomElevatedButton(
                    widget: Text('Login', style: AppFontstyle.fontStyle20),
                    onPress: () {
                      if (cubit.loginFormKey.currentState!.validate()) {
                        cubit.loging();
                      }
                    },
                  ),
            ],
          );
        },
      ),
    );
  }
}
