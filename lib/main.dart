import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/observer/simple_bloc_observer.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/auth/domain/use_cases/register_use_case.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_bloc/register_bloc.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_video_to_supabase_from_gallery_use_case.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/upload_videos_cubit/upload_video_from_gallery/upload_video_from_gallery_cubit.dart';
import 'package:tiktok_clone/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );
  serviceLocatorSetup();
  Bloc.observer = SimpleBlocObserver();
  runApp(DevicePreview(builder: (context) => const MainApp()));
  //-------------
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:
          (context, child) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (context) => RegisterBloc(getIt.get<RegisterUsesCase>()),
              ),
              BlocProvider(
                create:
                    (context) => UploadVideoFromGalleryCubit(
                      getIt.get<UploadVideosFromGalleryToSubaBaseUsesCase>(),
                    ),
              ),
            ],
            child: MaterialApp.router(
              theme: AppTheme.darkTheme,
              //  ThemeData.dark().copyWith(

              //   appBarTheme: AppBarTheme(
              //     centerTitle: true,
              //     titleTextStyle: AppFontstyle.bold30,
              //   ),
              //   progressIndicatorTheme: const ProgressIndicatorThemeData(
              //     color: Colors.white,
              //   ),
              // ),
              debugShowCheckedModeBanner: false,
              // home: const AuthTest(),
              routerConfig: AppRouter.router,
            ),
          ),
    );
  }
}
