import 'package:tiktok_clone/features/settings/domain/repo/update_user_data_repo.dart';

class UpdateUserDataUseCase {
  final UpdateUserDataRepo user;

  UpdateUserDataUseCase(this.user);

  Future<void> call(String name) async {
    return await user.updateUserInfo(name: name);
  }
}
