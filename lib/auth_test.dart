import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/errors/supabase_error_handler.dart';
import 'package:tiktok_clone/core/utils/validator.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_textform_field.dart';

class AuthTest extends StatefulWidget {
  const AuthTest({super.key});

  @override
  State<AuthTest> createState() => _AuthTestState();
}

class _AuthTestState extends State<AuthTest> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Register')),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              CustomTextFormField(
                hintText: 'Email',
                controller: email,
                validator: (value) => checkEmailValidator(value),
              ),
              CustomTextFormField(
                hintText: 'Password',
                controller: password,
                validator: (value) => checkPasswordValidator(value),
              ),
              CustomElevatedButton(
                widget: const Text('Register'),
                onPress: () async {
                  try {
                    final res = await Constant.supabase.auth.signUp(
                      email: email.text,
                      password: password.text,
                    );

                    if (res.session == null && res.user != null) {
                      // الإيميل متسجل ومش مفعل
                      CustomSnackBar.errorSnackBar(
                        context,
                        message:
                            'هذا البريد الإلكتروني مسجل بالفعل، تحقق من بريدك لتفعيل الحساب.',
                      );
                      return;
                    }

                    CustomSnackBar.successSnackBar(
                      context,
                      message: 'تم التسجيل بنجاح. تحقق من بريدك الإلكتروني.',
                    );
                  } on AuthException catch (e) {
                    final err = mapSupabaseAuthError(e.message);
                    CustomSnackBar.errorSnackBar(context, message: err);
                  } catch (e) {
                    CustomSnackBar.errorSnackBar(
                      context,
                      message: 'حدث خطأ غير متوقع.',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
