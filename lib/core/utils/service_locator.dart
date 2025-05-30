import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tiktok_clone/features/home/data/data_source/home_remote_data_source.dart';
import 'package:tiktok_clone/features/home/data/repo/home_repo_impl.dart';
import 'package:tiktok_clone/features/home/domain/use_cases/fetch_videos_use_case.dart';
import 'package:tiktok_clone/features/post_videos/data/data_source/camera_remote_data_source.dart';
import 'package:tiktok_clone/features/post_videos/data/data_source/upload_video_to_supabase_remote_data_source.dart';
import 'package:tiktok_clone/features/post_videos/data/repo/camera_repo_impl.dart';
import 'package:tiktok_clone/features/post_videos/data/repo/upload_video_to_supabase_repoimpl.dart';
import 'package:tiktok_clone/features/post_videos/domain/repo/upload_video_to_supabase_repo.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/dispose_camera_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/init_camera_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/start_record_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/stop_record_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_video_to_supabase_from_gallery_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_videos_to_supabase_use_case.dart';

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
  //------------Camera Services
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
  getIt.registerSingleton<DisposeCameraUsesCase>(
    DisposeCameraUsesCase(getIt.get<CameraRepoImpl>()),
  );
  //----------------Uplaod videos Services------
  getIt.registerSingleton<UploadVideoToSupabaseRemoteDataSourceImpl>(
    UploadVideoToSupabaseRemoteDataSourceImpl(),
  );
  getIt.registerSingleton<UploadVideoToSupabaseRepo>(
    UploadVideoToSupabaseRepoimpl(
      getIt.get<UploadVideoToSupabaseRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<UploadVideosToSubaBaseUseCase>(
    UploadVideosToSubaBaseUseCase(getIt.get<UploadVideoToSupabaseRepo>()),
  );
  //------------
  getIt.registerSingleton<UploadVideosToSubaBaseFromGalleryUsesCase>(
    UploadVideosToSubaBaseFromGalleryUsesCase(
      getIt.get<UploadVideoToSupabaseRepo>(),
    ),
  );
}
