import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_state.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';

class LoginCubit extends Cubit<UserAuthState> {
  LoginCubit(this.authRepoImpl) : super(AuthInital());
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final AuthRepoImpl authRepoImpl;
  void loging() async {
    try {
      emit(LoginLoading());
      await authRepoImpl.login(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      ).then((value) {
        
      },);
      emit(LoginSuccess(succMessage: 'Welcome Back !.'));
      emit(LoginLoading());
    } catch (e) {
      print(e.toString());
      emit(LoginFailure(errMessage: 'Your password or email is incorrect'));
    }
  }
}
