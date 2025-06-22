import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_my_videos_cubit/fetch_my_videos_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_my_videos_cubit/fetch_my_videos_state.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/custom_no_videos_message.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/my_videos_grid_view.dart';

class FetchMyVideosBlocBuilder extends StatelessWidget {
  const FetchMyVideosBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<FetchMyVideosCubit, FetchMyVideosState>(
        builder: (context, state) {
          if (state is FetchMyVideosSuccess) {
            List<String> videos = state.videosUrl;
            if (videos.isEmpty) {
              return const CustomNoVideosMessage();
            }
            return MyVideosGridView(videos: videos);
          } else if (state is FetchMyVideosLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchMyVideosFailure) {
            return Center(
              child: Text(state.errMessage, style: AppFontstyle.fontStyle20),
            );
          } else {
            return const Center(child: Text('There is Some thing went Wrong'));
          }
        },
      ),
    );
  }
}
