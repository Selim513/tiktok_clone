import 'package:tiktok_clone/core/uses_case/fetch_videos_uses_case.dart';
import 'package:tiktok_clone/features/home/domain/repo/home_repo.dart';

class FetchVideosUsesCase extends FetchUsesCase<List<String>> {
  final HomeRepo homeRepo;

  FetchVideosUsesCase(this.homeRepo);

  @override
  Future<List<String>> call() async {
    return await homeRepo.fetchVideos();
  }
}
