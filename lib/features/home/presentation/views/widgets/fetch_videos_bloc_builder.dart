import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_cubit/fetch_videos_cubit.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_cubit/fetch_videos_state.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/page_view_videos.dart';

class FetchVideosBlocBuilder extends StatelessWidget {
  const FetchVideosBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchVideosCubit, FetchVideosState>(
      builder: (context, state) {
        if (state is FetchVideosSuccess) {
          var videos = state.videos;
          return PageViewVideos(videos: videos);
        } else if (state is FetchVideosFailure) {
          return Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error ${state.errMessage}',
                  style: AppFontstyle.normal20,
                  textAlign: TextAlign.center,
                ),
                CustomElevatedButton(
                  width: 150,
                  widget: Text('Try Again', style: AppFontstyle.normal20),
                  onPress: () {},
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
