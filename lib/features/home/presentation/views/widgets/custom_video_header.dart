
import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

class CustomVideoHeader extends StatelessWidget {
  const CustomVideoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 10,
      child: Text('Video', style: AppFontstyle.fontStyle30),
    );
  }
}
