import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/my_videos_and_saved_videos_section.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/user_info_section_bloc_builder.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Column(
        spacing: 10.sp,
        children: const [
          UserInfoSectionBlocBuilder(),

          MyVideosAndSavedVideosSection(),
        ],
      ),
    );
  }
}
