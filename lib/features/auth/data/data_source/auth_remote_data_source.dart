import 'package:supabase_flutter/supabase_flutter.dart';

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
    Supabase supabase = Supabase.instance;
    final AuthResponse res = await supabase.client.auth.signUp(
      email: email,
      password: password,
      data: {'Name': name},
    );
    return res;
  }

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final AuthResponse res = await Supabase.instance.client.auth
        .signInWithPassword(email: email, password: password);
    return res;
  }
}
