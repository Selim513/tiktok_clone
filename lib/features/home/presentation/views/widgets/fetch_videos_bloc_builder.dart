import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_bloc/fecth_videos_bloc_bloc.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/page_view_videos.dart';

class FetchVideosBlocBuilder extends StatelessWidget {
  const FetchVideosBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FecthVideosBloc, FecthVideosBlocState>(
      builder: (context, state) {
        if (state.status == BlocStatus.success) {
          var videos = state.videos!;
          return PageViewVideos(videos: videos);
        } else if (state.status == BlocStatus.fail) {
          return Center(
            child: Column(
              spacing: 20.sp,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.errMessage}',
                  style: AppFontstyle.normal20,
                  textAlign: TextAlign.center,
                ),
                CustomElevatedButton(
                  width: 150.sp,
                  widget: Text('Try Again', style: AppFontstyle.normal20),
                  onPress: () {
                    context.read<FecthVideosBloc>().add(FetchVideosEvent());
                  },
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
