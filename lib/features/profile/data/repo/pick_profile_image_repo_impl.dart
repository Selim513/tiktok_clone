import 'package:tiktok_clone/features/profile/data/data_soruce/pick_profile_image_remote_data_source.dart';
import 'package:tiktok_clone/features/profile/domain/repo/upload_profile_image_repo.dart';

class PickProfileImageRepoImpl extends PickProileImageRepo {
  final PickProfileImageRemoteDataSourceImpl
  pickProfileImageRemoteDataSourceImpl;

  PickProfileImageRepoImpl(this.pickProfileImageRemoteDataSourceImpl);
  @override
  Future pickProfileImageFromCamera() async {
    try {
      await pickProfileImageRemoteDataSourceImpl.pickProfileImageFromCamera();
    } on Exception catch (e) {
      print('Thereee is an erorr ${e.toString()}');
    }
  }

  @override
  Future pickProfileImageFromImage() {
    // TODO: implement pickProfileImageFromImage
    throw UnimplementedError();
  }
}
