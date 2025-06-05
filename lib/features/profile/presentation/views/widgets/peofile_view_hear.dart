import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(name ?? 'user', style: AppFontstyle.fontStyle20),
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
      ),
    );
  }
}
