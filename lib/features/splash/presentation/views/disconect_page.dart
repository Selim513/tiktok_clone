import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/widgets/custom_refresh_indicator.dart';

class DisconectPage extends StatefulWidget {
  const DisconectPage({super.key});

  @override
  State<DisconectPage> createState() => _DisconectPageState();
}

class _DisconectPageState extends State<DisconectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Disconnect', style: AppFontstyle.bold30)],
          ),
        ),
      ),
    );
  }
}
