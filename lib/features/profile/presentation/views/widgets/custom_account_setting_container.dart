import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountSettingContainer extends StatefulWidget {
  const AccountSettingContainer({super.key});

  @override
  State<AccountSettingContainer> createState() =>
      _AccountSettingContainerState();
}

class _AccountSettingContainerState extends State<AccountSettingContainer> {
  String? name;
  String? email;
  @override
  void initState() {
    super.initState();
    final user = Supabase.instance.client.auth.currentUser;
    name = user?.userMetadata?['Name'];
    email = user?.email;
    // email = user?.userMetadata?['email'] as String?;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        SettingsTile(
          title: 'Name',
          subTitle: name ?? 'user',
          icon: Icons.person,
          onTap: () {
            // Supabase.instance.client.auth.updateUser(
            //   UserAttributes(data: {'Name': 'Selim'}),
            // );
          },
        ),
        SettingsTile(
          icon: Icons.email_outlined,
          title: 'Email',
          subTitle: email ?? 'exapmle@gmail.com',
          onTap: () {
            //   Supabase.instance.client.auth.updateUser(
            //   UserAttributes(email: 'New email'),
            // );
          },
        ),
        SettingsTile(
          icon: Icons.password,
          title: 'Password',
          onTap: () {
            // Supabase.instance.client.auth.updateUser(
            //   UserAttributes(password: 'NewPassword'),
            // );
          },
        ),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    this.subTitle,
    required this.icon,
    this.onTap,
  });
  final String title;
  final String? subTitle;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 10,
        children: [
          Icon(icon),
          Text(title),
          Spacer(),
          Text(subTitle ?? '', style: TextStyle(color: Colors.grey)),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
