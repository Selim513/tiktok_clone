import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/peofile_view_header.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/profile_view_image.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  String? name;
  String? imageUrl;
  @override
  void initState() {
    super.initState();
    final user = Constant.supabase.auth.currentUser;
    name = user?.userMetadata?['Name'];
    imageUrl = user?.userMetadata?['picture'] as String?;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Column(
        children: [
          const ProfileViewHeader(),
          const Gap(50),

          ProfileViewImage(imageUrl: imageUrl ?? ''),

          const Gap(30),
          Text(name ?? 'User', style: AppFontstyle.fontStyle30),
          const Gap(20),
          // const MyVideosAndSavedVideosSection(),
        ],
      ),
    );
  }
}
