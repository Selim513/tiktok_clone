import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tiktok_clone/features/post_videos/data/data_source/camera_remote_data_source.dart';
import 'package:tiktok_clone/features/post_videos/data/repo/camera_repo_impl.dart';
import 'package:tiktok_clone/features/post_videos/domain/uses_case/camera_uses_case/dispose_camera_uses_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/uses_case/camera_uses_case/init_camera_uses_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/uses_case/camera_uses_case/start_record_uses_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/uses_case/camera_uses_case/stop_record_uses_case.dart';
import 'package:tiktok_clone/features/post_videos/data/data_source/upload_video_to_supabase_remote_data_source.dart';
import 'package:tiktok_clone/features/post_videos/data/repo/upload_video_to_supabase_repoimpl.dart';
import 'package:tiktok_clone/features/post_videos/domain/repo/upload_video_to_supabase_repo.dart';
import 'package:tiktok_clone/features/post_videos/domain/uses_case/upload_videos_uses_case/upload_video_to_supabase_from_gallery.dart';
import 'package:tiktok_clone/features/post_videos/domain/uses_case/upload_videos_uses_case/upload_videos_to_supabase.dart';
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
  getIt.registerSingleton<UploadVideosToSubaBaseUsesCase>(
    UploadVideosToSubaBaseUsesCase(getIt.get<UploadVideoToSupabaseRepo>()),
  );
  //------------
  getIt.registerSingleton<UploadVideosToSubaBaseFromGalleryUsesCase>(
    UploadVideosToSubaBaseFromGalleryUsesCase(
      getIt.get<UploadVideoToSupabaseRepo>(),
    ),
  );
}
