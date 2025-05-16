import 'package:tiktok_clone/features/home/data/data_source/home_remote_data_source.dart';
import 'package:tiktok_clone/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;

  HomeRepoImpl({required this.homeRemoteDataSourceImpl});
  @override
  Future<List<String>> fetchVideos() async {
    try {
      var videos = await homeRemoteDataSourceImpl.fetchVideos();
      return videos;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
