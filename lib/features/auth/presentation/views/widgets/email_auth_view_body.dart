import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/utils/validator.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class EmailSignUpViewBody extends StatelessWidget {
  const EmailSignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.succMessage),
              backgroundColor: Colors.green,
            ),
          );
          GoRouter.of(context).pushNamed(AppRouter.kLoginView);
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = context.read<RegisterCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: cubit.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text('Join Us', style: AppFontstyle.fontStyle30),
                Gap(30),
                CustomTextFormField(
                  keyboardType: TextInputType.name,
                  controller: cubit.userNameController,
                  prefixIcon: Icon(FontAwesomeIcons.user),
                  hintText: 'User name',
                ),
                CustomTextFormField(
                  validator: (value) {
                    return checkEmailValidator(value);
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: cubit.registerEmailController,
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Email address',
                ),
                CusotmPasswordTextFormField(
                  controller: cubit.registerPasswordController,
                ),
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
