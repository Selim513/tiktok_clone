import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/auth/domain/repo/auth_repo.dart';

class RegisterUsesCase extends AuthUseCases<AuthResponse, RegisterParams> {
  final AuthRepo authRepo;

  RegisterUsesCase({required this.authRepo});

  @override
  Future<AuthResponse> call(RegisterParams params) async {
    return await authRepo.register(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}
