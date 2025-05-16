import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/home/domain/uses_case/fetch_videos_uses_case.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_cubit/fetch_videos_cubit.dart';
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
      const CameraScreen(),
      ProfileView(),
    ];
    return Scaffold(
      body: BlocProvider(
        create:
            (context) =>
                FetchVideosCubit(getIt.get<FetchVideosUsesCase>())
                  ..fetchVideos(),
        child: SafeArea(child: pages[currentIndex]),
      ),

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
