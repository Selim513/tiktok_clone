import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/enums/bloc_status.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_auth_text_button.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_bloc/login_bloc.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_bloc/login_bloc_state.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_bloc/login_events.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/login_form_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocConsumer<LoginBloc, LoginBlocState>(
        listener: (context, state) {
          if (state.status == BlocStatus.success) {
            CustomSnackBar.successSnackBar(
              context,
              message: state.succMessage!,
            );
            GoRouter.of(context).goNamed(AppRouter.kMainTab);
          } else if (state.status == BlocStatus.fail) {
            CustomSnackBar.errorSnackBar(context, message: state.errMessage!);
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    LoginFormSection(
                      loginEmailController: loginEmailController,
                      loginFormKey: loginFormKey,
                      loginPasswordController: loginPasswordController,
                    ),
                    state.status == BlocStatus.loading
                        ? const CircularProgressIndicator()
                        : CustomElevatedButton(
                          widget: Text('Login', style: AppFontstyle.normal20),
                          onPress: () {
                            if (loginFormKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(
                                LoginSubmittedEvent(
                                  email: loginEmailController.text,
                                  password: loginPasswordController.text,
                                ),
                              );
                            }
                          },
                        ),
                    // const Spacer(),
                    AuthTextButton(
                      onPressd:
                          () => context.pushNamed(AppRouter.kResetPassword),
                      title: 'Forget my password?',
                      buttonName: 'Resset password',
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
