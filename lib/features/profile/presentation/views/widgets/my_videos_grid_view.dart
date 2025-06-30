import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/custom_video_thumbnail.dart';

class MyVideosGridView extends StatelessWidget {
  const MyVideosGridView({super.key, required this.videos});
  final List<String> videos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: videos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(1.sp),
          child: VideoThumbnailWidget(
            videoUrl: videos[index],
            onTap: () {
              GoRouter.of(context).pushNamed(
                AppRouter.kVideoPreviw,
                extra: {
                  Constant.isPreview: true,
                  Constant.videoPreviewUrl: videos[index],
                },
              );
            },
          ),
        );
      },
    );
  }
}
