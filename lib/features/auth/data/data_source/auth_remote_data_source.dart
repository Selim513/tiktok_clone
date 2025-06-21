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
      final AuthResponse res = await Constant.supabase.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: 'com.example.tiktok_clone://auth-callback/',
        data: {'Name': name},
      );
      return res;
    }
    //  on AuthException catch (e) {
    //   throw AuthenticationException(e.message);
    // }
    catch (e) {
      throw AuthenticationException(e.toString());
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
    }
    // on AuthException catch (e) {
    //   throw AuthenticationException(e.message);
    // }
    catch (e) {
      throw AuthenticationException(e.toString());
    }
  }
}
