import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/auth/domain/repo/google_auth_repo.dart';

class GoogleAuthUseCase {
  final GoogleAuthRepo googleAuth;

  GoogleAuthUseCase(this.googleAuth);
  Future<AuthResponse> call() {
    return googleAuth.googleAuth();
  }
}
