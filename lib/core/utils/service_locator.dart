import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tiktok_clone/features/camera_record/data/data_source/camera_remote_data_source.dart';
import 'package:tiktok_clone/features/camera_record/data/repo/camera_repo_impl.dart';
import 'package:tiktok_clone/features/camera_record/domain/uses_case/init_camera_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/domain/uses_case/start_record_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/domain/uses_case/stop_record_uses_case.dart';
import 'package:tiktok_clone/features/home/data/data_source/home_remote_data_source.dart';
import 'package:tiktok_clone/features/home/data/repo/home_repo_impl.dart';
import 'package:tiktok_clone/features/home/domain/uses_case/fetch_videos_uses_case.dart';

final getIt = GetIt.instance;

void serviceLocatorSetup() {
  //--------- Auth service Locator-----
  getIt.registerSingleton<AuthRemoteDataSourceImpl>(AuthRemoteDataSourceImpl());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(authRemoteDataSourceImpl: AuthRemoteDataSourceImpl()),
  );
  //-------- FetchVideos service locator----
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(HomeRemoteDataSourceImpl());
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSourceImpl: getIt.get<HomeRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<FetchVideosUsesCase>(
    FetchVideosUsesCase(getIt.get<HomeRepoImpl>()),
  );
  //------------
  getIt.registerSingleton<CameraRemoteDataSourceImpl>(
    CameraRemoteDataSourceImpl(),
  );
  getIt.registerSingleton<CameraRepoImpl>(
    CameraRepoImpl(getIt.get<CameraRemoteDataSourceImpl>()),
  );
  getIt.registerSingleton<InitCameraUsesCase>(
    InitCameraUsesCase(getIt.get<CameraRepoImpl>()),
  );
  getIt.registerSingleton<StartRecordUsesCase>(
    StartRecordUsesCase(getIt.get<CameraRepoImpl>()),
  );
  getIt.registerSingleton<StopRecordUsesCase>(
    StopRecordUsesCase(getIt.get<CameraRepoImpl>()),
  );
}
