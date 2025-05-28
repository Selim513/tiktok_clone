import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/auth/presentation/views/auth_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/login_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/sign_up_with_email.dart';
import 'package:tiktok_clone/features/auth/presentation/views/sign_up_with_google.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/uses_case/dispose_camera_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/uses_case/init_camera_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/uses_case/start_record_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/uses_case/stop_record_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/presentation/manger/camera_cubit/camera_cubit.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/presentation/views/widgets/camera_record_view_body.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/presentation/views/video_preview.dart';
import 'package:tiktok_clone/features/home/presentation/views/home_view.dart';
import 'package:tiktok_clone/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kAuth = '/auth';
  static const kSignUpWithEmail = '/signUpWithEmail';
  static const kSignUpWithGoogle = '/signUpWithGoogle';
  static const kLoginView = '/loginView';
  static const kHome = '/home';
  static const kCameraRecord = '/cameraRecord';

  static const kCameraPreviw = '/cameraPreview';

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
        builder: (context, state) => EmailAuthView(),
      ),
      GoRoute(
        name: kSignUpWithGoogle,
        path: kSignUpWithGoogle,
        builder: (context, state) => GoogleAuthView(),
      ),
      GoRoute(
        path: kLoginView,
        name: kLoginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: kHome,
        name: kHome,
        builder: (context, state) => HomeView(),
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
              child: CameraRecordViewBody(),
            ),
      ),
      GoRoute(
        path: kCameraPreviw,
        name: kCameraPreviw,
        builder: (context, state) {
          final videoPath = state.extra as String;
          return VideoPreview(videoPath: videoPath);
        },
      ),
    ],
  );
}
