import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/utils/function_helper.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/settings_tile.dart';

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
    final user = Constant.supabase.auth.currentUser;
    name = user?.userMetadata?['Name'];
    email = user?.email;
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
            GoRouter.of(context).pushNamed(AppRouter.kNameEdit);
          },
        ),
        SettingsTile(
          icon: Icons.email_outlined,
          title: 'Email',
          subTitle: obfuscateEmail(email ?? 'example@gmail.com'),
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
            customShowDialogResetPasswordRequest(context);
          },
        ),
      ],
    );
  }
}
