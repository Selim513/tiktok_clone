import 'package:flutter/widgets.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/vedio_view.dart';

class PageViewVideos extends StatelessWidget {
  const PageViewVideos({super.key, required this.videos});

  final List<String> videos;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,

        itemBuilder: (context, index) {
          return VideoScreen(videoUrl: videos[index]);
        },
      ),
    );
  }
}
