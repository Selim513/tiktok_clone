import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

class DisconectPage extends StatelessWidget {
  const DisconectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Disconnect', style: AppFontstyle.bold30)],
        ),
      ),
    );
  }
}
