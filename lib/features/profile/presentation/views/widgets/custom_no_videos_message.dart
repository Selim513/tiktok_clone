import 'package:flutter/widgets.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

class CustomNoVideosMessage extends StatelessWidget {
  const CustomNoVideosMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'You haven’t uploaded any videos yet. Start by uploading your first one!',
        textAlign: TextAlign.center,
        style: AppFontstyle.fontStyle20,
      ),
    );
  }
}
