import 'package:flutter/widgets.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/video_preview.dart';

class PageViewVideos extends StatelessWidget {
  const PageViewVideos({super.key, required this.videos});

  final List<String> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,

      itemBuilder: (context, index) {
        return VideoPreview(videoUrl: videos[index]);
      },
    );
  }
}
