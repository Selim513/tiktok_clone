import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tiktok_clone/constant.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () async {
        final bool isConnected =
            await InternetConnectionChecker.instance.hasConnection;

        if (!mounted) return;
        if (isConnected) {
          final user = Constant.supabase.auth.currentUser;
          if (user == null) {
            context.goNamed(AppRouter.kAuth);
          } else {
            context.goNamed(AppRouter.kMainTab);
          }
        } else {
          context.goNamed(AppRouter.kNoInterNet);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 150.sp,
                backgroundImage: const AssetImage(
                  'assets/icon_lanuch/app_icon.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
