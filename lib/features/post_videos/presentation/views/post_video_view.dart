import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_video_to_supabase_from_gallery_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_videos_from_camera_to_supabase_use_case.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/post_video_bloc/post_video_bloc.dart';
import 'package:tiktok_clone/features/post_videos/presentation/views/widgets/video_source_selector.dart';

class PostVideoView extends StatelessWidget {
  const PostVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PostVideoBloc(
            getIt.get<UploadVideosFromCameraToSubaBaseUseCase>(),
            getIt.get<UploadVideosFromGalleryToSubaBaseUsesCase>(),
          ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Camera')),
        backgroundColor: Colors.black,
        body: const PostVideoViewBody(),
      ),
    );
  }
}
