import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CameraExitButton extends StatelessWidget {
  const CameraExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 20, top: 40),
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(onTap: () {}, child: Icon(FontAwesomeIcons.x)),
      ),
    );
  }
}
