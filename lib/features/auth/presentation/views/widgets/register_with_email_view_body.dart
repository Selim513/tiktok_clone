import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/register_form_section.dart';

class RegisterWithEmailViewBody extends StatelessWidget {
  const RegisterWithEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, UserAuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          CustomSnackBar.successSnackBar(context, message: state.succMessage);
          GoRouter.of(context).pushNamed(AppRouter.kLoginView);
        } else if (state is RegisterFailure) {
          CustomSnackBar.successSnackBar(
            context,
            message: state.errMessage,
            isSuccess: false,
          );
        }
      },
      builder: (context, state) {
        var cubit = context.read<RegisterCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RegisterFormSection(cubit: cubit),
                state is RegisterLoading
                    ? CircularProgressIndicator()
                    : CustomElevatedButton(
                      widget: Text(
                        'Register Now',
                        style: AppFontstyle.fontStyle20,
                      ),
                      onPress: () {
                        cubit.register();
                      },
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
