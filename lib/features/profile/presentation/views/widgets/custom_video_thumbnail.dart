
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailWidget extends StatelessWidget {
  final String videoUrl;
  final VoidCallback onTap;

  const VideoThumbnailWidget({
    super.key,
    required this.videoUrl,
    required this.onTap,
  });

  Future<Uint8List?> _getThumbnail() async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: videoUrl,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 200,
      quality: 25,
    );
    return uint8list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _getThumbnail(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return GestureDetector(
            onTap: onTap,
            child: Image.memory(snapshot.data!, fit: BoxFit.cover),
          );
        } else {
          return const Icon(Icons.broken_image);
        }
      },
    );
  }
}
