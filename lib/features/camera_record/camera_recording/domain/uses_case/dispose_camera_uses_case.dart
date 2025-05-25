import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/repo/camera_repo.dart';

class DisposeCameraUsesCase extends UsesCase<void> {
  final CameraRepo cameraRepo;

  DisposeCameraUsesCase(this.cameraRepo);

  @override
  Future<void> call() async {
    return await cameraRepo.disposeCamera();
  }
}
