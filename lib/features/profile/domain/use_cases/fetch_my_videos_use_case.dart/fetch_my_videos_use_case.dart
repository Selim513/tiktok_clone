import 'package:tiktok_clone/features/profile/domain/repo/fetch_my_videos_repo.dart';

class FetchMyVideosUseCase {
  final FetchMyVideosRepo fetchMyVideosRepo;

  FetchMyVideosUseCase(this.fetchMyVideosRepo);

  Future<List<String>> call() {
    return fetchMyVideosRepo.myVideos();
  }
}
