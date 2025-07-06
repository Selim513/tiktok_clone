import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  void cacheVideos(List<String> videos);
  List<String> getCachedVideos();
  void clearCachedVideos();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  static const String _boxName = 'video_cache_box';
  static const String _videosKey = 'cached_videos';

  @override
  List<String> getCachedVideos() {
    final box = Hive.box(_boxName);
    final cached = box.get(_boxName);

    if (cached is List) {
      return cached.whereType<String>().toList();
    }
    return [];
  }

  @override
  void cacheVideos(List<String> videos) async {
    final box = Hive.box(_boxName);
    await box.put(_videosKey, videos);
  }

  @override
  void clearCachedVideos() async {
    final box = Hive.box(_boxName);
    await box.delete(_videosKey);
  }
}
