import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<AuthResponse> register({
    required String email,
    required String password,
    String name,
  });
  Future<AuthResponse> login({required String email, required String password});
}
