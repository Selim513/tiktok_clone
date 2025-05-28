import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';

class VideoSourceSelector extends StatelessWidget {
  const VideoSourceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            widget: Text('Camera Shot', style: AppFontstyle.fontStyle20),
            onPress: () {
              GoRouter.of(context).pushNamed(AppRouter.kCameraRecord);
            },
          ),
          CustomElevatedButton(
            widget: Text('From Gallery', style: AppFontstyle.fontStyle20),
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
