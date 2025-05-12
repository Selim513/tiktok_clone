import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/custom_better_vedio_widget.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Videos')),
      body: Column(
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
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
