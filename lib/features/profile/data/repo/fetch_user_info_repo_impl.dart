import 'package:tiktok_clone/features/profile/data/data_soruce/fetch_user_info_remote_data_source/fetch_user_info_remote_data_source.dart';
import 'package:tiktok_clone/features/profile/domain/entities/user_info_entity.dart';
import 'package:tiktok_clone/features/profile/domain/repo/fetch_user_info_repo.dart';

class FetchUserInfoRepoImpl extends FetchUserInfoRepo {
  final FetchUserInfoRemoteDataSource users;

  FetchUserInfoRepoImpl(this.users);
  @override
  Future<UserInfoEntity> fetchUserInfo() async {
    try {
      return await users.fetchUserInfo();
    } catch (e) {
      print(e);
      throw Exception('--------${e.toString()}');
    }
  }
}
