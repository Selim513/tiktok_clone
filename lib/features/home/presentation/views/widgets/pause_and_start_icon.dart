import 'dart:async';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

class TikTokStyleControls extends StatefulWidget {
  final BetterPlayerController controller;

  const TikTokStyleControls(this.controller, {super.key});

  @override
  State<TikTokStyleControls> createState() => TikTokStyleControlsState();
}

class TikTokStyleControlsState extends State<TikTokStyleControls> {
  bool _visible = true;
  Timer? _hideTimer;
  @override
  void initState() {
    super.initState();
    _startHideTimer();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _visible = false;
        });
      }
    });
  }

  void _togglePlayPause() {
    final isPlaying = widget.controller.isPlaying() ?? false;
    if (isPlaying) {
      widget.controller.pause();
    } else {
      widget.controller.play();
    }
    setState(() {
      _visible = true;
    });
    _startHideTimer();

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _visible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _togglePlayPause,
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 10,
            child: Text('Video', style: AppFontstyle.fontStyle30),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Icon(
                widget.controller.isPlaying() == true
                    ? FontAwesomeIcons.pause
                    : FontAwesomeIcons.play,
                size: 60,
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
