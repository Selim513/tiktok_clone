import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

class CustomProfileVideosToggleButtons extends StatelessWidget {
  const CustomProfileVideosToggleButtons({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(title, style: AppFontstyle.fontStyle20),
        ),
      ),
    );
  }
}
