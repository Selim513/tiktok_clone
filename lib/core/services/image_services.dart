import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

void pickImageFromCamera({required String? imagePath}) async {
  final pickImage = await ImagePicker().pickImage(source: ImageSource.camera);

  var supabase = Supabase.instance.client.auth.currentUser;
  final file = File(pickImage!.path);
  final fileName = const Uuid().v4();

  var filePath = await Supabase.instance.client.storage
      .from('profile-image')
      .upload('profile-image${supabase!.id}/$fileName.jpg', file);
  try {
    await Supabase.instance.client.storage
        .from('profile-image')
        .upload(filePath, file, fileOptions: FileOptions(upsert: true));
    final imageUrl = Supabase.instance.client.storage
        .from('avatars')
        .getPublicUrl(filePath);
    await Supabase.instance.client.auth.updateUser(
      UserAttributes(data: {'profile-url': imageUrl}),
    );
  } catch (e) {
    print(e);
  }
}
