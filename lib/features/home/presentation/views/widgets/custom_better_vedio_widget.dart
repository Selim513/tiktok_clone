import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;

  const VideoScreen({super.key, required this.videoUrl});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
        autoPlay: true,
        looping: true,
        aspectRatio: 9 / 16,
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
    return Scaffold(body: Center(child: BetterPlayer(controller: _controller)));
  }
}

// قائمة روابط الفيديوهات
final List<String> videoUrls = [
  "https://cdn.pixabay.com/video/2019/04/06/22634-328940142_small.mp4",
  "https://cdn.pixabay.com/video/2019/04/06/22634-328940142_small.mp4",
];
