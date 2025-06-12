import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/my_videos_and_saved_videos_section.dart';
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
    final user = Supabase.instance.client.auth.currentUser;
    name = user?.userMetadata?['Name'];
    imageUrl = user?.userMetadata?['picture'] as String?;
    print("-------------------------------$imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Column(
        children: [
          ProfileViewHeader(),
          Gap(50),

          ProfileViewImage(imageUrl: imageUrl),

          Gap(30),
          Text(name ?? 'User', style: AppFontstyle.fontStyle30),
          Gap(20),
          MyVideosAndSavedVideosSection(),
        ],
      ),
    );
  }
}
