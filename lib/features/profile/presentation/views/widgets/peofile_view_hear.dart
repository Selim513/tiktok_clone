import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Gap(15),
        Text('Profile', style: AppFontstyle.fontStyle30),
        Spacer(),
        IconButton(
          onPressed: () async {
            await Supabase.instance.client.auth.signOut().then((value) {
              GoRouter.of(context).goNamed(AppRouter.kAuth);
            });
          },
          icon: Icon(Icons.logout, color: Colors.red),
        ),
      ],
    );
  }
}
