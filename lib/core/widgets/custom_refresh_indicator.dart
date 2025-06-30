import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/utils/app_color.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });
  final Widget child;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.transparent,
      color: AppColors.whiteColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
