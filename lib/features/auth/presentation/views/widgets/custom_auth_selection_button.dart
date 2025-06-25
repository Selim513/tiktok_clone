import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_color.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';

class CustomAutthSelectionButton extends StatelessWidget {
  const CustomAutthSelectionButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPress,
  });
  final IconData icon;
  final String title;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      color: const Color(0xff2E2B32),
      onPress: onPress,
      widget: Row(
        children: [
          Icon(icon, size: 25.sp, color: AppColors.whiteColor),
          const Spacer(),
          Text(title, style: AppFontstyle.medium25.copyWith(fontSize: 18.sp)),
          const Spacer(),
        ],
      ),
    );
  }
}
