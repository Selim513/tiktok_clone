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
          Icon(
            Icons.signal_wifi_statusbar_connected_no_internet_4_outlined,
            size: 50,
          ),
          Text(
            'You haven’t uploaded any videos yet. Start by uploading your first one!',
            textAlign: TextAlign.center,
            style: AppFontstyle.fontStyle20,
          ),
        ],
      ),
    );
  }
}
