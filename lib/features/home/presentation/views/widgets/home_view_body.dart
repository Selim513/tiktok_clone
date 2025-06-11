import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
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
      body: BlocBuilder<FetchVideosCubit, FetchVideosState>(
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
                    style: AppFontstyle.fontStyle20,
                    textAlign: TextAlign.center,
                  ),
                  CustomElevatedButton(
                    width: 150,
                    widget: Text('Try Again', style: AppFontstyle.fontStyle20),
                    onPress: () {
                      setState(() {});
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
