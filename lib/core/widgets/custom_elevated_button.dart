import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/core/utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.widget,
    this.onPress,
    this.color,
    this.borderSide,
    this.height,
    this.width,
  });
  final Widget widget;
  final void Function()? onPress;
  final Color? color;
  final BorderSide? borderSide;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 60.sp,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
            side: borderSide ?? BorderSide.none,
          ),
          backgroundColor: color ?? AppColors.redColor,
        ),
        onPressed: onPress,
        child: widget,
      ),
    );
  }
}
