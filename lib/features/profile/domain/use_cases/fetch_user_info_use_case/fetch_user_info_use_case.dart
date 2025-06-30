import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/profile/data/models/user_info_model.dart';
import 'package:tiktok_clone/features/profile/domain/entities/user_info_entity.dart';
import 'package:tiktok_clone/features/profile/domain/repo/fetch_user_info_repo.dart';

class FetchUserInfoUseCase extends UsesCase<UserInfoEntity, NoParam> {
  final FetchUserInfoRepo user;

  FetchUserInfoUseCase(this.user);
  @override
  Future<UserInfoEntity> call([NoParam? params]) async {
    return await user.fetchUserInfo();
  }
}
