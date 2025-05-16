import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/uses_case/auth_uses_case.dart';
import 'package:tiktok_clone/features/auth/domain/repo/auth_repo.dart';

class LoginUsesCase extends AuthUseCases<AuthResponse, LoginParams> {
  final AuthRepo authRepo;

  LoginUsesCase({required this.authRepo});

  @override
  Future<AuthResponse> call(LoginParams params) async {
    return await authRepo.login(email: params.email, password: params.password);
  }
}
