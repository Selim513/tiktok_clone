import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/post_videos/presentation/views/camera_record_view.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:tiktok_clone/features/profile/presentation/views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeViewBody(),
      CameraRecordView(),
      ProfileView(),
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
