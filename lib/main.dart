import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/observer/simple_bloc_observer.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth/google_auth_cubit.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/uses_case/dispose_camera_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/uses_case/init_camera_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/uses_case/start_record_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/uses_case/stop_record_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/presentation/manger/camera_cubit/camera_cubit.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/presentation/views/camera_record_view.dart';
import 'package:tiktok_clone/features/home/domain/uses_case/fetch_videos_uses_case.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_cubit/fetch_videos_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocatorSetup();
  await Supabase.initialize(
    url: 'https://sgulxgoevpmygnebscao.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndWx4Z29ldnBteWduZWJzY2FvIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzE1MzQ2OSwiZXhwIjoyMDYyNzI5NDY5fQ.GvgBH6K84Yaz86_TcRkGm1UFTYybADkS_lF5vPrLvm0',
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MainApp());
  //-------------
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FetchVideosCubit(getIt.get<FetchVideosUsesCase>())
                    ..fetchVideos(),
        ),
        BlocProvider(create: (context) => GoogleAuthCubit()),
        BlocProvider(
          create:
              (context) => CameraCubit(
                getIt.get<InitCameraUsesCase>(),
                getIt.get<StartRecordUsesCase>(),
                getIt.get<StopRecordUsesCase>(),
                getIt.get<DisposeCameraUsesCase>(),
              )..initCamera(),
        ),
      ],

      child: MaterialApp(
        theme: ThemeData.dark().copyWith(),
        debugShowCheckedModeBanner: false,
        home: CameraScreen(),
        // routerConfig: AppRouter.router,
      ),
    );
  }
}
