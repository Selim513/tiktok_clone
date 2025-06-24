import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/custom_account_setting_container.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/custom_settings_container.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/settings_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(15),
        child: ListView(
          children: [
            const CustomSettingsContainer(
              title: 'Account',
              widget: AccountSettingContainer(),
            ),
            const Gap(20),
            CustomSettingsContainer(
              title: 'Logout',
              widget: Column(
                children: [
                  SettingsTile(
                    title: 'Logout',
                    icon: Icons.logout_outlined,
                    onTap: () async {
                      await Supabase.instance.client.auth.signOut();
                      if (context.mounted) {
                        GoRouter.of(context).goNamed(AppRouter.kAuth);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
