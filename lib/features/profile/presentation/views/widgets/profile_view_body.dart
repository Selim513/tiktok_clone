import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_bloc_state.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_info_bloc.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/my_videos_and_saved_videos_section.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/peofile_view_header.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/profile_view_image.dart';

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
        spacing: 20.sp,
        children: [
          const ProfileViewHeader(),

          BlocBuilder<FetchUserInfoBloc, FetchUserBlocState>(
            builder: (context, state) {
              if (state.status == BlocStatus.success) {
                var user = state.userInfoEntity;

                return Column(
                  spacing: 20.sp,
                  children: [
                    ProfileViewImage(imageUrl: user?.image ?? ''),
                    Text(user?.name ?? '', style: AppFontstyle.bold30),
                  ],
                );
              } else if (state.status == BlocStatus.fail) {
                return const Center(child: Text('Please check your Internet'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),

          const Gap(20),
          // ProfileVideoButtonSelection(),
          const MyVideosAndSavedVideosSection(),
        ],
      ),
    );
  }
}
