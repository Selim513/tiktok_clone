import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/repo/camera_repo.dart';

class StartRecordUsesCase extends UsesCase<void> {
  final CameraRepo cameraRepo;

  StartRecordUsesCase(this.cameraRepo);
  @override
  Future<void> call() async {
    return await cameraRepo.startRecording();
  }
}
