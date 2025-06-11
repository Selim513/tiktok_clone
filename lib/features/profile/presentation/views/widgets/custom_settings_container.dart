import 'package:flutter/material.dart';

class CustomSettingsContainer extends StatelessWidget {
  const CustomSettingsContainer({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xff1E1E1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget,
    );
  }
}
