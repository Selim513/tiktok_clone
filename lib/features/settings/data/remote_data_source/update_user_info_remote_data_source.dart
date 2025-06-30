import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/constant.dart';

abstract class UpdateUserInfoRemoteDataSource {
  Future<void> updateUserInfo({required String name});
}

class UpdateUserInfoRemoteDataSourceImpl
    extends UpdateUserInfoRemoteDataSource {
  SupabaseClient supabaseClient = Constant.supabase;

  @override
  Future<void> updateUserInfo({required String name}) async {
    try {
      await supabaseClient.auth.updateUser(
        UserAttributes(data: {'Name': name}),
      );
      debugPrint('Nameeee----$name');
    } catch (e) {
      throw Exception(e);
    }
  }
}
