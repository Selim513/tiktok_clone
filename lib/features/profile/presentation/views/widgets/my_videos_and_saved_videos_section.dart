import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/custom_profile_videos_toggle_button.dart';

class MyVideosAndSavedVideosSection extends StatelessWidget {
  const MyVideosAndSavedVideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              CustomProfileVideosToggleButtons(
                title: 'My Videos',
                onTap: () {},
              ),
              Gap(10),
              CustomProfileVideosToggleButtons(title: 'Saved', onTap: () {}),
            ],
          ),
          Gap(15),
          Flexible(
            child: GridView.builder(
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).pushNamed(AppRouter.kVideoPreviw, extra: '');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,

                      border: Border.all(color: Colors.black),
                    ),
                    child: Text('Video $index'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
