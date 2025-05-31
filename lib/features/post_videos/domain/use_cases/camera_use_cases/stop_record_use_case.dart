import 'package:camera/camera.dart';
import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/repo/camera_repo.dart';

class StopRecordUsesCase extends UsesCase<XFile, void> {
  final CameraRepo cameraRepo;

  StopRecordUsesCase(this.cameraRepo);
  @override
  Future<XFile> call([void_]) async {
    return await cameraRepo.stopRecording();
  }
}
