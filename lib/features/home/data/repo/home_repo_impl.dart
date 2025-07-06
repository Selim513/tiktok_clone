import 'package:tiktok_clone/features/home/data/data_source/home_local_data_source.dart';
import 'package:tiktok_clone/features/home/data/data_source/home_remote_data_source.dart';
import 'package:tiktok_clone/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSourceImpl remoteVideos;
  final HomeLocalDataSourceImpl localVideos;

  HomeRepoImpl({required this.localVideos,required this.remoteVideos});
  @override
  Future<List<String>> fetchVideos() async {
    try {
      var cachedVideos = localVideos.getCachedVideos();
      if (cachedVideos.isNotEmpty) {
        return cachedVideos;
      }

      var videos = await remoteVideos.fetchVideos();
      return videos;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
