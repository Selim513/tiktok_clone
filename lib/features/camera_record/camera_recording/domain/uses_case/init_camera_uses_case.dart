import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/repo/camera_repo.dart';

class InitCameraUsesCase extends UsesCase<void,void> {
  final CameraRepo cameraRepo;

  InitCameraUsesCase(this.cameraRepo);

  @override
  Future<void> call([void _]) async {
    return await cameraRepo.initCamera();
  }
}
