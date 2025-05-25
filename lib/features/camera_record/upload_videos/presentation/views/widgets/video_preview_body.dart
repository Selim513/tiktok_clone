import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/presentation/views/widgets/camera_exit_button.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/presentation/views/widgets/video_preview_action_buttons.dart';

class VideoPreviewBody extends StatelessWidget {
  const VideoPreviewBody({super.key, required this.betterPlayerController});

  final BetterPlayerController betterPlayerController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BetterPlayer(controller: betterPlayerController),
        VideoPreviewActionsButtons(),
        CameraExitButton(),
      ],
    );
  }
}
