import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FetchMyVideosRemoteDataSource {
  Future<List<String>> fetchMyVideos();
}

class FetchMyVideosRemoteDataSorceImpl extends FetchMyVideosRemoteDataSource {
  @override
  Future<List<String>> fetchMyVideos() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    var supabaseStorage = Supabase.instance.client.storage;
    final res = await supabaseStorage
        .from('videos')
        .list(path: 'videos/user_videos/$userId');
    final videoUrl =
        res.map((file) {
          return supabaseStorage
              .from('videos')
              .getPublicUrl('user_videos/$userId');
        }).toList();

    return videoUrl;
  }
}
