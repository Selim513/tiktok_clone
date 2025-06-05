import 'package:tiktok_clone/features/profile/data/data_soruce/pick_profile_image_remote_data_source.dart';
import 'package:tiktok_clone/features/profile/domain/repo/upload_profile_image_repo.dart';

class PickProfileImageRepoImpl extends PickProileImageRepo {
  final PickProfileImageRemoteDataSourceImpl
  pickProfileImageRemoteDataSourceImpl;

  PickProfileImageRepoImpl(this.pickProfileImageRemoteDataSourceImpl);
  @override
  Future<String?> pickProfileImageFromCamera() async {
    try {
      var imageUrl =
          await pickProfileImageRemoteDataSourceImpl
              .pickProfileImageFromCamera();
      return imageUrl;
    } on Exception {
      throw Exception('-----There is an error');
    }
  }

  @override
  Future<String?> pickProfileImageFromGallery() async {
    try {
      var imageUrl =
          await pickProfileImageRemoteDataSourceImpl
              .pickProfileImageFromGallery();
      return imageUrl;
    } on Exception {
      throw Exception('-----There is an error');
    }
  }
}
