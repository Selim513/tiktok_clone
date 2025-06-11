import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/custom_account_setting_container.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/custom_settings_container.dart';

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
            Text(
              'Account',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomSettingsContainer(widget: AccountSettingContainer()),
          ],
        ),
      ),
    );
  }
}
