import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_cubit/fetch_videos_cubit.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_cubit/fetch_videos_state.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/page_view_videos.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<FetchVideosCubit, FetchVideosState>(
            builder: (context, state) {
              if (state is FetchVideosSuccess) {
                var videos = state.videos;
                return Positioned.fill(child: PageViewVideos(videos: videos));
              } else if (state is FetchVideosFailure) {
                return Center(child: Text('Error ${state.errMessage}'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            left: 30,
            top: 50,
            child: Text('Videos', style: AppFontstyle.fontStyle30),
          ),
        ],
      ),
    );
  }
}
