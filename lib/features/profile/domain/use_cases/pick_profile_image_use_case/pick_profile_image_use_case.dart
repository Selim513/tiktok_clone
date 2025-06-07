import 'package:tiktok_clone/features/profile/domain/repo/upload_profile_image_repo.dart';

class PickProfileImageFromCameraUseCase {
  final PickProileImageRepo pickProfileImageUseCase;

  PickProfileImageFromCameraUseCase(this.pickProfileImageUseCase);

  Future<String?> call() {
    return pickProfileImageUseCase.pickProfileImageFromCamera();
  }
}
