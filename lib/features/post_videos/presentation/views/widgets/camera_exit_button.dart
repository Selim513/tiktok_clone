import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';

class CameraExitButton extends StatelessWidget {
  const CameraExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 20, top: 40),
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).goNamed(AppRouter.kHome);
          },
          child: Icon(FontAwesomeIcons.x),
        ),
      ),
    );
  }
}
