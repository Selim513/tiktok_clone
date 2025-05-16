import 'package:camera/camera.dart';
import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/camera_record/domain/repo/camera_repo.dart';

class StopRecordUsesCase extends UsesCase<XFile> {
  final CameraRepo cameraRepo;

  StopRecordUsesCase(this.cameraRepo);
  @override
  Future<XFile> call() async {
    return await cameraRepo.stopRecording();
  }
}
