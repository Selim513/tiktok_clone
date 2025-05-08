import 'package:flutter/material.dart';
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
      color: Color(0xff2E2B32),
      onPress: onPress,
      widget: Row(
        children: [
          Icon(icon, size: 25, color: Colors.white),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
