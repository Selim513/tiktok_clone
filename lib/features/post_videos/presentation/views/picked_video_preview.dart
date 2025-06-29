import 'dart:io';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_video_to_supabase_from_gallery_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_videos_from_camera_to_supabase_use_case.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/post_video_bloc/post_video_bloc.dart';
import 'package:tiktok_clone/features/post_videos/presentation/views/widgets/video_preview_body.dart';

class PickedVideoPreview extends StatefulWidget {
  const PickedVideoPreview({super.key, required this.videoPath});
  final String videoPath;
  @override
  State<PickedVideoPreview> createState() => _PickedVideoPreviewState();
}

class _PickedVideoPreviewState extends State<PickedVideoPreview> {
  late BetterPlayerController betterPlayerController;
  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      widget.videoPath,
    );
    betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        autoPlay: true,

        controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: false,
        ),
        aspectRatio: 9 / 16,
        fit: BoxFit.contain,
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  @override
  void dispose() {
    betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoFile = File(widget.videoPath);
    return Scaffold(
      body: BlocProvider(
        create:
            (context) => PostVideoBloc(
              getIt.get<UploadVideosFromCameraToSubaBaseUseCase>(),
              getIt.get<UploadVideosFromGalleryToSubaBaseUsesCase>(),
            ),
        child: VideoPreviewBody(
          betterPlayerController: betterPlayerController,
          videoFile: videoFile,
        ),
      ),
    );
  }
}
