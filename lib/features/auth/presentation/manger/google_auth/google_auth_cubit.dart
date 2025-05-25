import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth/google_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());

  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    try {
      Supabase supabase = Supabase.instance;
      await supabase.client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'com.example.tiktok_clone://login-callback',
      );

      emit(GoogleAuthSuccess());
    } catch (e) {
      emit(GoogleAuthFailure(e.toString()));
    }
  }
}
