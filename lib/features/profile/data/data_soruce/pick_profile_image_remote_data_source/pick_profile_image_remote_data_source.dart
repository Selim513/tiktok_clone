import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/constant.dart';

abstract class PickProfileImageRemoteDataSource {
  Future<String?> pickProfileImageFromCamera();
  Future<String?> pickProfileImageFromGallery();
}

class PickProfileImageRemoteDataSourceImpl
    extends PickProfileImageRemoteDataSource {
  @override
  Future<String?> pickProfileImageFromCamera() async {
    var userClient = Constant.supabase;
    var userId = userClient.auth.currentUser?.id;
    SupabaseStorageClient storage = userClient.storage;
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return '';
      }
      var imageFile = File(image.path);

      final puplicUrl = storage.from('profile-image').getPublicUrl('$userId');
      if (userClient.auth.currentUser?.userMetadata?['picture'] == puplicUrl) {
        await userClient.storage.from('profile-image').remove(['$userId']);
        await storage
            .from('profile-image')
            .upload(
              '$userId',
              imageFile,
              fileOptions: const FileOptions(upsert: true),
            );
      }
      userClient.auth.updateUser(UserAttributes(data: {'picture': puplicUrl}));

      return puplicUrl;
    } catch (e) {
      print('Erooooooooooooor ${e.toString()}');
      throw Exception('There is an eerror happen ${e.toString()}');
    }
  }

  //--------------------
  @override
  Future<String?> pickProfileImageFromGallery() async {
    var userClient = Constant.supabase;
    var userId = userClient.auth.currentUser?.id;
    SupabaseStorageClient storage = userClient.storage;
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return '';
      }
      var imageFile = File(image.path);

      final puplicUrl = storage.from('profile-image').getPublicUrl('$userId');
      if (userClient.auth.currentUser?.userMetadata?['picture'] == puplicUrl) {
        await userClient.storage.from('profile-image').remove(['$userId']);
        await storage
            .from('profile-image')
            .upload(
              '$userId',
              imageFile,
              fileOptions: const FileOptions(upsert: true),
            );
      }
      userClient.auth.updateUser(UserAttributes(data: {'picture': puplicUrl}));

      return puplicUrl;
    } catch (e) {
      print('Erooooooooooooor${e.toString()}');
      throw Exception('There is an eerror happen ${e.toString()}');
    }
  }
}
