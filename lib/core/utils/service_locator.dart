import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tiktok_clone/features/auth/domain/use_cases/login_use_case.dart';
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
import 'package:tiktok_clone/features/profile/data/data_soruce/fetch_my_videos_remote_data_source/fetch_my_videos_remote_data_source.dart';
import 'package:tiktok_clone/features/profile/data/data_soruce/pick_profile_image_remote_data_source/pick_profile_image_remote_data_source.dart';
import 'package:tiktok_clone/features/profile/data/repo/fetch_my_videos_repo_impl.dart';
import 'package:tiktok_clone/features/profile/data/repo/pick_profile_image_repo_impl.dart';
import 'package:tiktok_clone/features/profile/domain/repo/fetch_my_videos_repo.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/fetch_my_videos_use_case.dart/fetch_my_videos_use_case.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_image_from_gallery.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_profile_image_use_case.dart';

final getIt = GetIt.instance;

void serviceLocatorSetup() {
  //--------- ----------------------------------Auth service Locator-----
  getIt.registerSingleton<AuthRemoteDataSourceImpl>(AuthRemoteDataSourceImpl());
  //-Auth repo
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(AuthRemoteDataSourceImpl()),
  );
  getIt.registerSingleton<LoginUsesCase>(
    LoginUsesCase(authRepo: getIt.get<AuthRepoImpl>()),
  );
  //------------------------------------------- FetchVideos service locator----
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(HomeRemoteDataSourceImpl());
  //--Home repo
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSourceImpl: getIt.get<HomeRemoteDataSourceImpl>(),
    ),
  );
  //-fetch videos uses case
  getIt.registerSingleton<FetchVideosUsesCase>(
    FetchVideosUsesCase(getIt.get<HomeRepoImpl>()),
  );
  //------------------------------------------------Camera Services
  getIt.registerSingleton<CameraRemoteDataSourceImpl>(
    CameraRemoteDataSourceImpl(),
  );
  //-Camera Repo
  getIt.registerSingleton<CameraRepoImpl>(
    CameraRepoImpl(getIt.get<CameraRemoteDataSourceImpl>()),
  );
  //-init Camera use case
  getIt.registerSingleton<InitCameraUsesCase>(
    InitCameraUsesCase(getIt.get<CameraRepoImpl>()),
  );
  //-start Camera use case
  getIt.registerSingleton<StartRecordUsesCase>(
    StartRecordUsesCase(getIt.get<CameraRepoImpl>()),
  );
  //-stop camera use case
  getIt.registerSingleton<StopRecordUsesCase>(
    StopRecordUsesCase(getIt.get<CameraRepoImpl>()),
  );
  //-dispose camera use case
  getIt.registerSingleton<DisposeCameraUsesCase>(
    DisposeCameraUsesCase(getIt.get<CameraRepoImpl>()),
  );

  //------------------------------------------------------Uplaod videos Services------
  getIt.registerSingleton<UploadVideoToSupabaseRemoteDataSourceImpl>(
    UploadVideoToSupabaseRemoteDataSourceImpl(),
  );
  //-Upload camera repo
  getIt.registerSingleton<UploadVideoToSupabaseRepo>(
    UploadVideoToSupabaseRepoimpl(
      getIt.get<UploadVideoToSupabaseRemoteDataSourceImpl>(),
    ),
  );
  //-Upload video use case
  getIt.registerSingleton<UploadVideosToSubaBaseUseCase>(
    UploadVideosToSubaBaseUseCase(getIt.get<UploadVideoToSupabaseRepo>()),
  );

  //- Upload From Gallery use case-------------
  getIt.registerSingleton<UploadVideosToSubaBaseFromGalleryUsesCase>(
    UploadVideosToSubaBaseFromGalleryUsesCase(
      getIt.get<UploadVideoToSupabaseRepo>(),
    ),
  );
  //----------------------------------------------Pick Profile Image------------------
  getIt.registerSingleton<PickProfileImageRemoteDataSourceImpl>(
    PickProfileImageRemoteDataSourceImpl(),
  );
  //-pick profile pic repo
  getIt.registerSingleton<PickProfileImageRepoImpl>(
    PickProfileImageRepoImpl(getIt.get<PickProfileImageRemoteDataSourceImpl>()),
  );
  //-pick profile pic from camera
  getIt.registerSingleton<PickProfileImageFromCameraUseCase>(
    PickProfileImageFromCameraUseCase(getIt.get<PickProfileImageRepoImpl>()),
  );
  //-pick profile pic from gallery

  getIt.registerSingleton<PickProfileImageFromGalleryUseCase>(
    PickProfileImageFromGalleryUseCase(getIt.get<PickProfileImageRepoImpl>()),
  );
  //-------------------------------------------------------Fetch My Videos----------------
  getIt.registerSingleton<FetchMyVideosRemoteDataSorceImpl>(
    FetchMyVideosRemoteDataSorceImpl(),
  );
  //-fetch my videos repo
  getIt.registerSingleton<FetchMyVideosRepo>(
    FetchMyVideosRepoImpl(getIt.get<FetchMyVideosRemoteDataSorceImpl>()),
  );
  //-fetch my videos use case
  getIt.registerSingleton<FetchMyVideosUseCase>(
    FetchMyVideosUseCase(getIt.get<FetchMyVideosRepo>()),
  );
  //----------------------------------------Supabase Client-
  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);
}
