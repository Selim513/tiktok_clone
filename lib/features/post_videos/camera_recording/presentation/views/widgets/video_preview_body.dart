import 'dart:io';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/post_videos/camera_recording/presentation/views/widgets/camera_exit_button.dart';
import 'package:tiktok_clone/features/post_videos/camera_recording/presentation/views/widgets/video_preview_action_buttons.dart';

class VideoPreviewBody extends StatelessWidget {
  const VideoPreviewBody({
    super.key,
    required this.betterPlayerController,
    required this.videoFile,
  });
  final File videoFile;

  final BetterPlayerController betterPlayerController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BetterPlayer(controller: betterPlayerController),
        VideoPreviewActionsButtons(vedioFile: videoFile),
        CameraExitButton(),
      ],
    );
  }
}
