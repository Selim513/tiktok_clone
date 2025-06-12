import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class MyVideosGridView extends StatelessWidget {
  const MyVideosGridView({super.key, required this.videos});
  final List<String>? videos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: videos?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return VideoThumbnailWidget(
          videoUrl: videos![index],
          onTap: () {
            GoRouter.of(context).pushNamed(
              AppRouter.kVideoPreviw,
              extra: {
                Constant.isPreview: true,
                Constant.videoPreviewUrl: videos?[index],
              },
            );
          },
        );
        // return GestureDetector(
        //   onTap: () async {
        //     await GoRouter.of(
        //       context,
        //     ).pushNamed(AppRouter.kVideoPreviw, extra: videos?[index]);
        //   },
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.red,

        //       border: Border.all(color: Colors.black),
        //     ),
        //     child: VideoPreview(videoUrl: videos![index], autoPlay: false),
        //   ),
        // );
      },
    );
  }
}

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
