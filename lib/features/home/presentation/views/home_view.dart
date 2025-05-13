import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:tiktok_clone/features/home/presentation/views/widgets/vedio_view.dart';
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

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<String> videoUrls = [];
  Future<void> fetchVideos() async {
    try {
      final response = await Supabase.instance.client.storage
          .from('videos')
          .list(path: 'user_videos');

      print("📦 Files found: ${response.length}");
      for (final file in response) {
        print("📦 File: ${file.name}");
      }

      videoUrls =
          response.map((file) {
            final url = Supabase.instance.client.storage
                .from('videos')
                .getPublicUrl('user_videos/${file.name}');
            print("🔗 Generated URL: $url");
            return url;
          }).toList();

      print("--------------------$videoUrls -------------${videoUrls.length}");
      setState(() {});
    } catch (e) {
      print("❌ Error fetching videos: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVideos().then((_) {
      setState(() {});
    });
  }

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
