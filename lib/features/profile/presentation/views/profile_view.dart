import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final name = user?.userMetadata?['Name'];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(name, style: AppFontstyle.fontStyle20)],
        ),
        Gap(50),
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/me.jpg'),
          ),
        ),
        Gap(30),
        Text('My Vedios', style: AppFontstyle.fontStyle30),
      ],
    );
  }
}
