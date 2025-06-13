import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/custom_account_setting_container.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/custom_settings_container.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/settings_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: ListView(
          children: [
            CustomSettingsContainer(
              title: 'Account',
              widget: AccountSettingContainer(),
            ),
            Gap(20),
            CustomSettingsContainer(
              title: 'Logout',
              widget: Column(
                children: [
                  SettingsTile(
                    title: 'Logout',
                    icon: Icons.logout_outlined,
                    onTap: () async {
                      await Supabase.instance.client.auth.signOut();
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
