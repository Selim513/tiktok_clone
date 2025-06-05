import 'package:tiktok_clone/features/profile/domain/repo/upload_profile_image_repo.dart';

class PickProfileImageFromGalleryUseCase {
  final PickProileImageRepo pickProfileImageUseCase;

  PickProfileImageFromGalleryUseCase(this.pickProfileImageUseCase);

  Future<String?> call() {
    return pickProfileImageUseCase.pickProfileImageFromGallery();
  }
}
