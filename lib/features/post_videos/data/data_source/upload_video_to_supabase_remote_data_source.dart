import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/errors/errors.dart';
import 'package:tiktok_clone/core/services/generate_unique_file_name.dart';

abstract class UploadVideoToSupabaseRemoteDataSource {
  Future<String> uploadVideoFromCameraToSupaBase({required File videoUrl});
  Future<String> uploadVideoToSubaBaseFromGallery();
}

class UploadVideoToSupabaseRemoteDataSourceImpl
    extends UploadVideoToSupabaseRemoteDataSource {
  SupabaseClient subaseClint = Constant.supabase;
  @override
  //-Upload videos From Camera
  Future<String> uploadVideoFromCameraToSupaBase({
    required File videoUrl,
  }) async {
    final userId = subaseClint.auth.currentUser?.id;
    final fileName = generateUniqueFileName(videoUrl.path);

    await subaseClint.storage
        .from('videos')
        .upload('user_videos/$userId/$fileName', videoUrl);
    final publicUrl = subaseClint.storage.from('videos').getPublicUrl(fileName);
    return publicUrl;
  }

  //-Upload videos From Gallery
  @override
  Future<String> uploadVideoToSubaBaseFromGallery() async {
    final userId = subaseClint.auth.currentUser?.id;
    final pickVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickVideo == null) {
      throw extractErrorMessage('You have not select any video.');
    }
    final fileName = generateUniqueFileName(pickVideo.path);
    final File videoFile = File(pickVideo.path);
    await subaseClint.storage
        .from('videos')
        .upload('user_videos/$userId/$fileName', videoFile);
    final publicUrl = subaseClint.storage.from('videos').getPublicUrl(fileName);
    return publicUrl;
  }
}
