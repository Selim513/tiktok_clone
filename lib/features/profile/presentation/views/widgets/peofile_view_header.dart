import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Gap(15),
        Text('Profile', style: AppFontstyle.bold30),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRouter.kSettingsView);
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
