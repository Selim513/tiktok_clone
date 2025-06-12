import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
              widget: AccountSettingContainer(),
              title: 'Account',
            ),
            Gap(20),
            CustomSettingsContainer(
              title: 'Logout',
              widget: Column(
                children: [
                  SettingsTile(title: 'Logout', icon: Icons.logout_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
