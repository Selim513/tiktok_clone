import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/post_videos/presentation/views/widgets/video_source_selector.dart';

class CameraRecordView extends StatelessWidget {
  const CameraRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),
      backgroundColor: Colors.black,
      body: const VideoSourceSelector(),
    );
  }
}
