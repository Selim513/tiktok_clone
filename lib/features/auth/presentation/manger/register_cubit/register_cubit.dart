import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<UserAuthState> {
  RegisterCubit(this.authRepoImpl) : super(AuthInital());
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  final AuthRepoImpl authRepoImpl;

  void register() async {
    emit(RegisterLoading());
    try {
      await authRepoImpl.register(
        email: registerEmailController.text,
        password: registerPasswordController.text,
        name: userNameController.text,
      );

      emit(RegisterSuccess(succMessage: 'Account has been created please confirm your email !.'));
    } catch (e) {
      print(e.toString());
      emit(
        RegisterFailure(errMessage: '------------------------ ${e.toString()}'),
      );
    }
  }
}
