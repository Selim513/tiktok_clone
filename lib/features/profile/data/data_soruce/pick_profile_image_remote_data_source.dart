import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PickProfileImageRemoteDataSource {
  Future<String?> pickProfileImageFromCamera();
  Future pickProfileImageFromImage();
}

class PickProfileImageRemoteDataSourceImpl
    extends PickProfileImageRemoteDataSource {
  @override
  Future<String?> pickProfileImageFromCamera() async {
    var userId = Supabase.instance.client.auth.currentUser?.id;
    SupabaseStorageClient storage = Supabase.instance.client.storage;
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return '';
      }
      var imageFile = File(image.path);

      final puplicUrl = storage.from('profile-image').getPublicUrl('$userId');
      if (Supabase.instance.client.auth.currentUser?.userMetadata?['picture'] ==
          puplicUrl) {
        await Supabase.instance.client.storage.from('profile-image').remove([
          '$userId',
        ]);
        await storage
            .from('profile-image')
            .upload(
              '$userId',
              imageFile,
              fileOptions: FileOptions(upsert: true),
            );
      }
      Supabase.instance.client.auth.updateUser(
        UserAttributes(data: {'picture': puplicUrl}),
      );

      return puplicUrl;
    } catch (e) {
      print('Erooooooooooooor${e.toString()}');
      throw Exception('There is an eerror happen ${e.toString()}');
    }
  }

  //--------------------
  @override
  Future pickProfileImageFromImage() {
    // TODO: implement pickProfileImageFromImage
    throw UnimplementedError();
  }
}
