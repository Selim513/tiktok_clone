import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

class CustomNoVideosMessage extends StatelessWidget {
  const CustomNoVideosMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.upload, size: 50),
          Text(
            'You haven’t uploaded any videos yet. \n Start by uploading your first one!',
            textAlign: TextAlign.center,
            style: AppFontstyle.fontStyle20,
          ),
        ],
      ),
    );
  }
}
