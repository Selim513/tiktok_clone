import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/errors/errors.dart';
import 'package:tiktok_clone/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tiktok_clone/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

  AuthRepoImpl(this.authRemoteDataSourceImpl);
  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await authRemoteDataSourceImpl.login(
        email: email,
        password: password,
      );
      return res;
    } on AuthException catch (e) {
      throw AuthenticationException(extractErrorMessage(e));
    }
  }

  @override
  Future<AuthResponse> register({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      return await authRemoteDataSourceImpl.register(
        name: name!,
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw AuthenticationException(extractErrorMessage(e));
    }
  }
}
