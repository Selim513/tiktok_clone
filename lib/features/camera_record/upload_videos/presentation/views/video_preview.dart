import 'dart:io';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/data/data_source/upload_video_to_supabase_remote_data_source.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/data/repo/upload_video_to_supabase_repoimpl.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/domain/uses_case/upload_videos_to_supabase.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/presentation/cubit/upload_video_cubit.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/presentation/views/widgets/video_preview_body.dart';

class VideoPreview extends StatefulWidget {
  const VideoPreview({super.key, required this.videoPath});
  final String videoPath;
  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late BetterPlayerController betterPlayerController;
  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      widget.videoPath,
    );
    betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        looping: false,

        controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: false,
        ),
        expandToFill: true,
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
            (context) => UploadVideoCubit(
              UploadVideosToSubaBase(
                UploadVideoToSupabaseRepoimpl(
                  UploadVideoToSupabaseRemoteDataSourceImpl(),
                ),
              ),
            ),
        child: VideoPreviewBody(
          betterPlayerController: betterPlayerController,
          videoFile: videoFile,
        ),
      ),
    );
  }
}
