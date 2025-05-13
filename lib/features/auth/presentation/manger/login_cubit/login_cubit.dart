import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_state.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';

class LoginCubit extends Cubit<UserAuthState> {
  LoginCubit() : super(AuthInital());
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  void loging() async {
    try {
      emit(LoginLoading());
      final AuthResponse res = await Supabase.instance.client.auth
          .signInWithPassword(
            email: loginEmailController.text,

            password: loginPasswordController.text,
          );
      emit(LoginSuccess(succMessage: 'Welcome Back !.'));
      emit(LoginLoading());
    } catch (e) {
      print(e.toString());
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
