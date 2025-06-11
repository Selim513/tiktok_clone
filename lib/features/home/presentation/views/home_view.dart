import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/custom_video_header.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/fetch_videos_bloc_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [FetchVideosBlocBuilder(), CustomVideoHeader()]),
    );
  }
}
