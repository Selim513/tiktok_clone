import 'package:tiktok_clone/features/profile/data/models/user_info_model.dart';
import 'package:tiktok_clone/features/profile/domain/entities/user_info_entity.dart';

abstract class FetchUserInfoRepo {
  Future<UserInfoEntity> fetchUserInfo();
}
