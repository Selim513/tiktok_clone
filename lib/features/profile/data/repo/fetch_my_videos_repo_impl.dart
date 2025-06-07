import 'package:tiktok_clone/features/profile/data/data_soruce/fetch_my_videos_remote_data_source/fetch_my_videos_remote_data_source.dart';
import 'package:tiktok_clone/features/profile/domain/repo/fetch_my_videos_repo.dart';

class FetchMyVideosRepoImpl extends FetchMyVideosRepo {
  final FetchMyVideosRemoteDataSorceImpl fetchMyVideosRemoteDataSorceImpl;

  FetchMyVideosRepoImpl(this.fetchMyVideosRemoteDataSorceImpl);
  @override
  Future<List<String>> myVideos() async {
    try {
      var videosUrl = await fetchMyVideosRemoteDataSorceImpl.fetchMyVideos();
      return videosUrl;
    } catch (e) {
      throw Exception('Fetch My Videos Errorr====${e.toString()}');
    }
  }
}
