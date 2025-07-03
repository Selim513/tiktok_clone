import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/widgets/custom_refresh_indicator.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_bloc/fecth_videos_bloc_bloc.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/video_preview.dart';

class PageViewVideos extends StatelessWidget {
  const PageViewVideos({super.key, required this.videos});

  final List<String> videos;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        context.read<FecthVideosBloc>().add(FetchVideosEvent());
      },
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,

        itemBuilder: (context, index) {
          return VideoPreview(videoUrl: videos[index]);
        },
      ),
    );
  }
}
