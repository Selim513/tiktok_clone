import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

class ImagePickerOptionButton extends StatelessWidget {
  const ImagePickerOptionButton({
    super.key,
    required this.title,
    required this.onpress,
  });
  final String title;
  final void Function()? onpress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(  
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10),
        backgroundColor: Colors.black,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
      ),
      onPressed: onpress,
      child: Text(title, style: AppFontstyle.fontStyle20),
    );
  }
}
