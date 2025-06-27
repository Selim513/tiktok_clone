import 'dart:async';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class TikTokStyleControls extends StatefulWidget {
  final BetterPlayerController controller;
  final bool isPreview;
  const TikTokStyleControls(
    this.controller, {
    super.key,
    this.isPreview = false,
  });

  @override
  State<TikTokStyleControls> createState() => TikTokStyleControlsState();
}

class TikTokStyleControlsState extends State<TikTokStyleControls> {
  bool isSaved = false;
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
    _hideTimer = Timer(const Duration(seconds: 3), () {
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

    Future.delayed(const Duration(milliseconds: 100), () {
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
          widget.isPreview
              ? Positioned(
                top: 60,
                left: 10,
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child: const Icon(FontAwesomeIcons.x),
                ),
              )
              : const SizedBox(),
          Positioned(
            bottom: 40,
            right: 10,
            child: GestureDetector(
              onTap: () {
                isSaved = !isSaved;
                setState(() {});
              },
              child: Icon(
                Icons.bookmark_outlined,
                size: 40,
                color: isSaved ? Colors.amber : Colors.white,
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
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
