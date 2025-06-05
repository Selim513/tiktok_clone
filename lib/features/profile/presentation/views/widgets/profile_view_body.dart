import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/peofile_view_hear.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileViewHeader(name: name),
        Gap(50),

        ProfileViewImage(imageUrl: imageUrl),

        Gap(30),
        Text('My Videos', style: AppFontstyle.fontStyle30),
      ],
    );
  }
}
