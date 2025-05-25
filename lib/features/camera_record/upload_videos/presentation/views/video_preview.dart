import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: VideoPreviewBody(betterPlayerController: betterPlayerController),
    );
  }
}
