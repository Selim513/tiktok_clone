import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/repo/camera_repo.dart';

class StartRecordUsesCase extends UsesCase<void , void> {
  final CameraRepo cameraRepo;

  StartRecordUsesCase(this.cameraRepo);
  @override
  Future<void> call([void _]) async {
    return await cameraRepo.startRecording();
  }
}
