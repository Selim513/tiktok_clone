import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/home/presentation/views/home_view.dart';
import 'package:tiktok_clone/features/main/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:tiktok_clone/features/post_videos/presentation/views/post_video_view.dart';
import 'package:tiktok_clone/features/profile/presentation/views/profile_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeView(),
      const PostVideoView(),
      const ProfileView(),
    ];
    return Scaffold(
      body: SafeArea(child: pages[currentIndex]),

      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
