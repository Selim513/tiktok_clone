import 'package:tiktok_clone/features/settings/data/remote_data_source/update_user_info_remote_data_source.dart';
import 'package:tiktok_clone/features/settings/domain/repo/update_user_data_repo.dart';

class UpdateUserDataRepoImpl extends UpdateUserDataRepo {
  final UpdateUserInfoRemoteDataSource user;

  UpdateUserDataRepoImpl(this.user);
  @override
  Future<void> updateUserInfo({required String name}) async {
    try {
      await user.updateUserInfo(name: name);
    } catch (e) {
      throw Exception(e);
    }
  }
}
