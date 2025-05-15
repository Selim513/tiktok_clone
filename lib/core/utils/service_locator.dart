import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';

final getIt = GetIt.instance;

void serviceLocatorSetup() {
  getIt.registerSingleton<AuthRemoteDataSourceImpl>(AuthRemoteDataSourceImpl());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(authRemoteDataSourceImpl: AuthRemoteDataSourceImpl()),
  );
}
