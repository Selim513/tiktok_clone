import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    this.subTitle,
    required this.icon,
    this.onTap,
  });
  final String title;
  final String? subTitle;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 10,
        children: [
          Icon(icon),
          Text(title),
          const Spacer(),
          Text(
            subTitle ?? '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
