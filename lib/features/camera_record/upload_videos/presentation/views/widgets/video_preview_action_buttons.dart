import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';

class VideoPreviewActionsButtons extends StatelessWidget {
  const VideoPreviewActionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Row(
          spacing: 20,
          children: [
            Expanded(
              child: CustomElevatedButton(
                color: Colors.white,
                widget: Text(
                  'Another Shot',
                  textAlign: TextAlign.center,
                  style: AppFontstyle.fontStyle20.copyWith(color: Colors.black),
                ),
                onPress: () {},
              ),
            ),
            Expanded(
              child: CustomElevatedButton(
                widget: Text('Post', style: AppFontstyle.fontStyle20),
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
