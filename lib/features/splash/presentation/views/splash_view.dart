import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        GoRouter.of(context).goNamed(AppRouter.kAuth);
      } else {
        GoRouter.of(context).goNamed(AppRouter.kMainTab);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
