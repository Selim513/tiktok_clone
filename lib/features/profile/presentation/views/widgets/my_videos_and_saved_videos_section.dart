import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_my_videos_cubit/fetch_my_videos_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/custom_profile_videos_toggle_button.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/fetch_my_videos_bloc_builder.dart';

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
          if (isSelected == 0) FetchMyVideosBlocBuilder(),
          if (isSelected == 1) Center(child: Text('Savved')),
        ],
      ),
    );
  }
}
