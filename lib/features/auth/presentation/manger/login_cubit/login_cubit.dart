import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_state.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit() : super(AuthInital());
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  void loging() async {
    try {
      emit(LoginLoading());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );
      emit(LoginSuccess(succMessage: 'Welcome back !.'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'Email not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMessage: 'Password or the email is inccorect'));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
