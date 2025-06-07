import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/vedio_view.dart';

class MyVideosGridView extends StatelessWidget {
  const MyVideosGridView({super.key, required this.videos});
  final List<String> videos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: videos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).pushNamed(AppRouter.kVideoPreviw, extra: videos[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,

              border: Border.all(color: Colors.black),
            ),
            child: VideoPreview(videoUrl: videos[index], autoPlay: false),
          ),
        );
      },
    );
  }
}
