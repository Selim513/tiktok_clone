// import 'package:better_player_plus/better_player_plus.dart';
// import 'package:flutter/material.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Your Vedios')),
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: 2,
//               itemBuilder: (context, index) {
//                 return VideoScreen();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class VideoScreen extends StatefulWidget {
//   const VideoScreen({super.key});

//   @override
//   State<VideoScreen> createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   late BetterPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();

//     BetterPlayerDataSource dataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,
//       "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_1MB.mp4",
//     );

//     _controller = BetterPlayerController(
//       BetterPlayerConfiguration(
//         autoPlay: true,
//         looping: true,
//         aspectRatio: 9 / 16,
//         fit: BoxFit.cover,
//       ),
//       betterPlayerDataSource: dataSource,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: BetterPlayer(controller: _controller)));
//   }
// }
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';

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
    );
  }
}

class VideoScreen extends StatefulWidget {
  final String videoUrl;

  const VideoScreen({super.key, required this.videoUrl});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    super.initState();

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
    );

    _controller = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        looping: true,
        aspectRatio: 9 / 16,
        fit: BoxFit.cover,
      ),
      betterPlayerDataSource: dataSource,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: BetterPlayer(controller: _controller)));
  }
}

// قائمة روابط الفيديوهات
final List<String> videoUrls = [
  "https://cdn.pixabay.com/video/2019/04/06/22634-328940142_small.mp4",
];
