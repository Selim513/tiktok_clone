import 'package:flutter/widgets.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/features/profile/data/models/user_info_model.dart';

abstract class FetchUserInfoRemoteDataSource {
  Future<UserInfoModel> fetchUserInfo();
}

class FetchUserInfoRemoteDataSourceImpl extends FetchUserInfoRemoteDataSource {
  @override
  Future<UserInfoModel> fetchUserInfo() async {
    try {
      final userClient = Constant.supabase;
      final user = userClient.auth.currentUser;
      final name = user?.userMetadata?['Name'] ?? '';
      final image = user?.userMetadata?['picture'] ?? '';
      final email = user?.email;

      return UserInfoModel(name: name, image: image,email: email);
    } on Exception catch (e) {
      debugPrint('Exception:----${e.toString()}');
      throw Exception(e);
    }
  }
}
