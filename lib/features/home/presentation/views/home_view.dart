import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/custom_better_vedio_widget.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
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
      const CameraScreen(),
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

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (videoUrls.isEmpty)
          Center(
            child: Text(
              'There is no vedio be the first who upload',
              style: TextStyle(color: Colors.white),
            ),
          ),
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videoUrls.length,
            itemBuilder: (context, index) {
              return VideoScreen(videoUrl: videoUrls[index]);
            },
          ),
        ),
      ],
    );
  }
}
