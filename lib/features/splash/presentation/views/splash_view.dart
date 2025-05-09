import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    Future.delayed(Duration(seconds: 2)).then((value) {
      GoRouter.of(context).replaceNamed(AppRouter.kAuth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
