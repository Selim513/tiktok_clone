import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_state.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocConsumer<LoginCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.succMessage),
                backgroundColor: Colors.green,
              ),
            );
            GoRouter.of(context).goNamed(AppRouter.kHome);
          } else if (state is LoginFailure) {
            print('SUCCCCCCCCCCCCCCCCCCCCCCCCCC');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();
          return Form(
            key: cubit.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Text('Welcome Back!', style: AppFontstyle.fontStyle30),
                Gap(10),

                CustomTextFormField(
                  hintText: 'Email',
                  controller: cubit.loginEmailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  controller: cubit.loginPasswordController,
                ),
                Gap(10),
                // state is LoginLoading
                //     ? CircularProgressIndicator()
                //     :
                CustomElevatedButton(
                  widget: Text('Login', style: AppFontstyle.fontStyle20),
                  onPress: () {
                    if (cubit.loginFormKey.currentState!.validate()) {
                      cubit.loging();
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
