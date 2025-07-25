import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomSettingsContainer extends StatelessWidget {
  const CustomSettingsContainer({
    super.key,
    required this.widget,
    required this.title,
  });
  final Widget widget;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xff1E1E1E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: widget,
        ),
      ],
    );
  }
}
