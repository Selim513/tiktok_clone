import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/core/widgets/custom_refresh_indicator.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_info_bloc.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_info_event.dart';
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
      child: CustomRefreshIndicator(
        onRefresh: () async {
          context.read<FetchUserInfoBloc>().add(FetchUserInfoEvent());
        },
        child: CustomScrollView(
          // spacing: 10.sp,
          slivers: [
            const SliverToBoxAdapter(child: UserInfoSectionBlocBuilder()),
            SliverToBoxAdapter(child: Gap(10.sp)),
            const SliverFillRemaining(child: MyVideosAndSavedVideosSection()),
          ],
        ),
      ),
    );
  }
}
