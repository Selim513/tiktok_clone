import 'package:hive/hive.dart';

void saveVideos({required List<String> videos}) async {
  var box = Hive.box('video_cache_box');
  box.addAll(videos);
  //-
  final existingVideos = box.values.toList();
  final newVideos =
      videos.where((video) => !existingVideos.contains(video)).toList();
  //-
  await box.clear();
  await box.addAll(newVideos);
}
