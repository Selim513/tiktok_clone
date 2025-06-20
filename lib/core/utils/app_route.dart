import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/auth/data/repo/auth_repo_impl.dart';
import 'package:tiktok_clone/features/auth/domain/use_cases/login_use_case.dart';
import 'package:tiktok_clone/features/auth/domain/use_cases/register_use_case.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_bloc/login_bloc.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_bloc/register_bloc.dart';
import 'package:tiktok_clone/features/auth/presentation/views/auth_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/login_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/register_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/sign_up_with_google.dart';
import 'package:tiktok_clone/features/home/domain/use_cases/fetch_videos_use_case.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_cubit/fetch_videos_cubit.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/video_preview.dart';
import 'package:tiktok_clone/features/main/presentation/views/main_tab_view.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/dispose_camera_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/init_camera_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/start_record_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/stop_record_use_case.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/camera_cubit/camera_cubit.dart';
import 'package:tiktok_clone/features/post_videos/presentation/views/picked_video_preview.dart';
import 'package:tiktok_clone/features/post_videos/presentation/views/widgets/camera_record_view_body.dart';
import 'package:tiktok_clone/features/profile/presentation/views/profile_view.dart';
import 'package:tiktok_clone/features/settings/presentation/views/name_edit_view.dart';
import 'package:tiktok_clone/features/settings/presentation/views/password_reset_view.dart';
import 'package:tiktok_clone/features/settings/presentation/views/settings_view.dart';
import 'package:tiktok_clone/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kAuth = '/auth';
  static const kSignUpWithEmail = '/signUpWithEmail';
  static const kSignUpWithGoogle = '/signUpWithGoogle';
  static const kLoginView = '/loginView';
  static const kMainTab = '/mainTab';
  static const kCameraRecord = '/cameraRecord';

  static const kPickedVideoPreviw = '/pickedVideoPreview';
  static const kVideoPreviw = '/videoPreview';
  static const kProfileView = '/profileView';
  static const kSettingsView = '/settings';
  static const kNameEdit = '/nameEdit';
  static const kPasswordReset = '/reset-password';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        name: kAuth,
        path: kAuth,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        name: kSignUpWithEmail,
        path: kSignUpWithEmail,
        builder:
            (context, state) => BlocProvider(
              create: (context) => RegisterBloc(getIt.get<RegisterUsesCase>()),
              child: const RegisterView(),
            ),
      ),
      GoRoute(
        name: kSignUpWithGoogle,
        path: kSignUpWithGoogle,
        builder: (context, state) => const GoogleAuthCubitViewBody(),
      ),
      GoRoute(
        path: kLoginView,
        name: kLoginView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginBloc(getIt.get<LoginUsesCase>()),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: kMainTab,
        name: kMainTab,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      FetchVideosCubit(getIt.get<FetchVideosUsesCase>())
                        ..fetchVideos(),
              child: const MainTabView(),
            ),
      ),
      GoRoute(
        path: kProfileView,
        name: kProfileView,
        builder: (context, state) {
          return const ProfileView();
        },
      ),
      GoRoute(
        path: kSettingsView,
        name: kSettingsView,
        builder: (context, state) {
          return const SettingsView();
        },
        routes: [
          GoRoute(
            path: kNameEdit,
            name: kNameEdit,
            builder: (context, state) {
              return const NameEditView();
            },
          ),
          GoRoute(
            path: kPasswordReset,
            name: kPasswordReset,
            builder: (context, state) => const PasswordResetView(),
          ),
        ],
      ),
      GoRoute(
        path: kCameraRecord,
        name: kCameraRecord,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => CameraCubit(
                    getIt.get<InitCameraUsesCase>(),
                    getIt.get<StartRecordUsesCase>(),
                    getIt.get<StopRecordUsesCase>(),
                    getIt.get<DisposeCameraUsesCase>(),
                  )..initCamera(),
              child: const CameraRecordViewBody(),
            ),
      ),
      GoRoute(
        path: kPickedVideoPreviw,
        name: kPickedVideoPreviw,
        builder: (context, state) {
          final videoPath = state.extra as String;
          return PickedVideoPreview(videoPath: videoPath);
        },
      ),
      GoRoute(
        path: kVideoPreviw,
        name: kVideoPreviw,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final videoUrl = data[Constant.videoPreviewUrl] as String;
          final isPreview = data[Constant.isPreview] as bool;

          return VideoPreview(videoUrl: videoUrl, isPreview: isPreview);
        },
      ),
    ],
  );
}
