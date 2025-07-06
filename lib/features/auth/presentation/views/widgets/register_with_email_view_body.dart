import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_auth_text_button.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_bloc/register_bloc.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_bloc/register_bloc_state.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_bloc/register_event.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/register_form_section.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == BlocStatus.success) {
          CustomSnackBar.confrimEmailSnackBar(
            context,
            message: state.succMessage!,
          );
          GoRouter.of(context).goNamed(AppRouter.kAuth);
        } else if (state.status == BlocStatus.fail) {
          CustomSnackBar.errorSnackBar(context, message: state.errMessage!);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              spacing: 20.sp,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(40.sp),
                RegisterFormSection(
                  emailController: emailController,
                  formKey: formKey,
                  nameController: nameController,
                  passwordController: passwordController,
                ),
                state.status == BlocStatus.loading
                    ? const CircularProgressIndicator()
                    : CustomElevatedButton(
                      widget: Text(
                        'Register Now',
                        style: AppFontstyle.normal20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPress: () {
                        context.read<RegisterBloc>().add(
                          RegisterSubmittedEvent(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                    ),
                AuthTextButton(
                  onPressd: () {
                    context.pushReplacementNamed(AppRouter.kLoginView);
                  },
                  title: 'Already Have an Account',
                  buttonName: 'Login',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
