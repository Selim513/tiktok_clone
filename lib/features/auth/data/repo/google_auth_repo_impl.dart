import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/auth/data/data_source/google_auth_remote_data_source.dart';
import 'package:tiktok_clone/features/auth/domain/repo/google_auth_repo.dart';

class GoogleAuthRepoImpl extends GoogleAuthRepo {
  final GoogleAuthRemoteDataSource auth;

  GoogleAuthRepoImpl(this.auth);
  @override
  Future<AuthResponse> googleAuth() async {
    try {
      final user = auth.googleAuth();
      return user;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
