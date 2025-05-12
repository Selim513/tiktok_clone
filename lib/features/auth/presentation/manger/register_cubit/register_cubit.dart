import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<AuthState> {
  RegisterCubit() : super(AuthInital());
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  void register() async {
    emit(RegisterLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: registerEmailController.text,
            password: registerPasswordController.text,
          );
      FirebaseAuth.instance.currentUser?.updateDisplayName(
        userNameController.text,
      );
      emit(RegisterSuccess(succMessage: 'Account has been created!.'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          RegisterFailure(
            errMessage: 'The account already exists for that email.',
          ),
        );
      }
    } catch (e) {
      emit(
        RegisterFailure(errMessage: '------------------------ ${e.toString()}'),
      );
    }
  }
}
