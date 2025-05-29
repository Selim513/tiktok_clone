import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/observer/simple_bloc_observer.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/domain/uses_case/upload_video_to_supabase_from_gallery.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/presentation/cubit/upload_video_from_gallery/upload_video_from_gallery_cubit.dart';

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
    return BlocProvider(
      create:
          (context) => UploadVideoFromGalleryCubit(
            getIt.get<UploadVideosToSubaBaseFromGalleryUsesCase>(),
          ),
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(),
        debugShowCheckedModeBanner: false,
        // home: HomeViewBody(),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
