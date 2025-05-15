import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth/google_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());

  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    try {
      Supabase supabase = Supabase.instance;
      supabase.client.auth.signInWithOAuth(OAuthProvider.google);
      emit(GoogleAuthSuccess());
    } catch (e) {
      emit(GoogleAuthFailure(e.toString()));
    }
  }
}
