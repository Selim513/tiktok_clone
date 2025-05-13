import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<UserAuthState> {
  RegisterCubit() : super(AuthInital());
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  void register() async {
    Supabase supabase = Supabase.instance;
    emit(RegisterLoading());
    try {
      final AuthResponse res = await supabase.client.auth.signUp(
        email: registerEmailController.text,
        data: {'Name': userNameController.text},
        password: registerPasswordController.text,
      );
      emit(RegisterSuccess(succMessage: 'Account has been created !.'));
    } catch (e) {
      print(e.toString());
      emit(
        RegisterFailure(errMessage: '------------------------ ${e.toString()}'),
      );
    }
  }
}
