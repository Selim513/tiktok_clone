import 'package:tiktok_clone/features/profile/domain/repo/upload_profile_image_repo.dart';

class PickProfileImageUseCase {
  final PickProileImageRepo pickProfileImageUseCase;

  PickProfileImageUseCase(this.pickProfileImageUseCase);

  Future call() {
    return pickProfileImageUseCase.pickProfileImageFromCamera();
  }
}
