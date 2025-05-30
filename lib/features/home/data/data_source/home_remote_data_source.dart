import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeRemoteDataSource {
  Future<List<String>> fetchVideos();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<String>> fetchVideos() async {
    SupabaseClient supabase = Supabase.instance.client;
    
    final res = await supabase.storage.from('videos').list(path: 'user_videos');
    final urls =
        res.map((file) {
          return supabase.storage
              .from('videos')
              .getPublicUrl('user_videos/${file.name}');
        }).toList();
    urls.shuffle();
    return urls;
  }
}
