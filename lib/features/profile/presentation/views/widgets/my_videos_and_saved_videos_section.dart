import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_my_videos_cubit/fetch_my_videos_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_my_videos_cubit/fetch_my_videos_state.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/custom_profile_videos_toggle_button.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/my_videos_grid_view.dart';

class MyVideosAndSavedVideosSection extends StatefulWidget {
  const MyVideosAndSavedVideosSection({super.key});

  @override
  State<MyVideosAndSavedVideosSection> createState() =>
      _MyVideosAndSavedVideosSectionState();
}

class _MyVideosAndSavedVideosSectionState
    extends State<MyVideosAndSavedVideosSection> {
  int isSelected = 0;
  @override
  void initState() {
    super.initState();
    if (isSelected == 0) {
      context.read<FetchMyVideosCubit>().fetchMyVideos();
    } else {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              CustomProfileVideosToggleButtons(
                title: 'My Videos',
                onTap: () {
                  isSelected = 0;
                  setState(() {});
                  print(isSelected);
                },
              ),
              Gap(10),
              CustomProfileVideosToggleButtons(
                title: 'Saved',
                onTap: () {
                  isSelected = 1;
                  setState(() {});
                  print(isSelected);
                },
              ),
            ],
          ),
          Gap(15),
          if (isSelected == 0)
            Flexible(
              child: BlocBuilder<FetchMyVideosCubit, FetchMyVideosState>(
                builder: (context, state) {
                  if (state is FetchMyVideosSuccess) {
                    List<String> videos = state.videosUrl;
                    return MyVideosGridView(videos: videos);
                  } else if (state is FetchMyVideosLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is FetchMyVideosFailure) {
                    return Center(
                      child: Text(
                        state.errMessage,
                        style: AppFontstyle.fontStyle20,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text('There is Some thing went Wrong'),
                    );
                  }
                },
              ),
            ),
          if (isSelected == 1) Center(child: Text('Savved')),
        ],
      ),
    );
  }
}
