import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.widget,
    this.onPress,
    this.color,
    this.borderSide,
    this.height,
    this.width,
  });
  final Widget widget;
  final void Function()? onPress;
  final Color? color;
  final BorderSide? borderSide;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: borderSide ?? BorderSide.none,
          ),
          backgroundColor: color ?? Colors.red,
        ),
        onPressed: onPress,
        child: widget,
      ),
    );
  }
}
