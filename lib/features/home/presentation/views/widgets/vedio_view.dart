import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/pause_and_start_icon.dart';

class VideoPreview extends StatefulWidget {
  final String videoUrl;
  final bool autoPlay;

  const VideoPreview({super.key, required this.videoUrl,  this.autoPlay=true});

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    super.initState();

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
    );

    _controller = BetterPlayerController(
      BetterPlayerConfiguration(
        controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: false,

          enablePlayPause: true,
        ),

        autoPlay:widget.autoPlay ,
        looping: true,
        aspectRatio: 9 / 18,

        fit: BoxFit.cover,
      ),
      betterPlayerDataSource: dataSource,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: BetterPlayer(controller: _controller)),

          Positioned.fill(child: TikTokStyleControls(_controller)),
        ],
      ),
    );
  }
}
