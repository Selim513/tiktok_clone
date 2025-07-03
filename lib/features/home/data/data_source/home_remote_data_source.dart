import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/constant.dart';

abstract class HomeRemoteDataSource {
  Future<List<String>> fetchVideos();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  //-Fetch All Videos
  Future<List<String>> fetchVideos() async {
    SupabaseClient supabase = Constant.supabase;
    List<String> allVideoUrls = [];

    try {
      //-Fetch videos from user videos File
      final res = await supabase.storage
          .from('videos')
          .list(path: 'user_videos');
//-----
      for (final item in res) {
        //-Check if the video in folder or not

        if (_isVideoFile(item.name)) {
          //-fetch videos if the file of the video in the direct folder (user_videos)
          final url = supabase.storage
              .from('videos')
              .getPublicUrl('user_videos/${item.name}');
          allVideoUrls.add(url);
        } else {
          //-if not in the main folder (user_videos) and in the user folders Fetch from user folder
          try {
            final subFolderRes = await supabase.storage
                .from('videos')
                .list(path: 'user_videos/${item.name}');

            final subUrls =
                subFolderRes.where((subFile) => _isVideoFile(subFile.name)).map(
                  (subFile) {
                    return supabase.storage
                        .from('videos')
                        .getPublicUrl(
                          'user_videos/${item.name}/${subFile.name}',
                        );
                  },
                ).toList();

            allVideoUrls.addAll(subUrls);
          } catch (e) {
            print('Error fetching videos from user folder ${item.name}: $e');

            
          }
        }
      }
//- fetch the videos randomly 
      allVideoUrls.shuffle();
      return allVideoUrls;
    } catch (e) {
      print('Error fetching videos: $e');
      return [];
    }
  }

  //-Function to Check from the video file extensions
  bool _isVideoFile(String fileName) {
    final videoExtensions = [
      '.mp4',
      '.mov',
      '.avi',
      '.mkv',
      '.wmv',
      '.flv',
      '.webm',
      '.temp',
    ];
    final lowerFileName = fileName.toLowerCase();
    return videoExtensions.any((ext) => lowerFileName.endsWith(ext));
  }
}
