import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';

abstract class FetchMyVideosRemoteDataSource {
  Future<List<String>> fetchMyVideos();
}

class FetchMyVideosRemoteDataSorceImpl extends FetchMyVideosRemoteDataSource {
  @override
  Future<List<String>> fetchMyVideos() async {
    try {
      var supabaseClient = Constant.supabase;
      final userId = Constant.supabase.auth.currentUser?.id;
      var supabaseStorage = supabaseClient.storage;
      final res = await supabaseStorage
          .from('videos')
          .list(path: 'user_videos/$userId');
      final videoUrl =
          res.map((file) {
            return supabaseStorage
                .from('videos')
                .getPublicUrl('user_videos/$userId/${file.name}');
          }).toList();

      return videoUrl;
    } on Exception catch (e) {
      throw Exception('Erorrrrrrrrrrr${e.toString()}');
    }
  }
}
