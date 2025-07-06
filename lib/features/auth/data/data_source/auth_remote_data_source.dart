import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/errors/errors.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String name,
  });
  Future<AuthResponse> login({required String email, required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      //--Signup request
      final response = await Constant.supabase.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: 'com.example.tiktok_clone://auth-callback/',
        data: {'Name': name},
      );
      //---Check if the email exist
      final identities = response.user?.identities;

      if (identities!.isEmpty) {
        throw AuthenticationException(
          mapSupabaseAuthError('The email is Already exist'),
        );
      }
      //-check if the email not verfied

      return response;
    } on AuthException catch (e) {
      throw AuthenticationException(extractErrorMessage(e));
    }
  }

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await Constant.supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return res;
    } on AuthException catch (e) {
      throw AuthenticationException(extractErrorMessage(e));
    }
  }
}
