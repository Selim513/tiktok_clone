import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/services/generate_unique_file_name.dart';

abstract class UploadVideoToSupabaseRemoteDataSource {
  Future<String> uploadVideoToSupaBase({required File videoUrl});
  Future<String> uploadVideoToSubaBaseFromGallery();
}

class UploadVideoToSupabaseRemoteDataSourceImpl
    extends UploadVideoToSupabaseRemoteDataSource {
  @override
  Future<String> uploadVideoToSupaBase({required File videoUrl}) async {
    final SupabaseStorageClient supabaseStorage =
        Supabase.instance.client.storage;
    final userId = Supabase.instance.client.auth.currentUser?.id;
    final fileName = generateUniqueFileName(videoUrl.path);
    await supabaseStorage
        .from('videos')
        .upload('user_videos/$userId/$fileName', videoUrl);
    final publicUrl = supabaseStorage.from('videos').getPublicUrl(fileName);
    return publicUrl;
  }

  @override
  Future<String> uploadVideoToSubaBaseFromGallery() async {
    final SupabaseStorageClient supabaseStorage =
        Supabase.instance.client.storage;
    final userId = Supabase.instance.client.auth.currentUser?.id;
    final pickVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickVideo == null) {
      throw Exception('UploadCancelled');
    }
    final fileName = generateUniqueFileName(pickVideo.path);
    final File videoFile = File(pickVideo.path);
    await supabaseStorage
        .from('videos')
        .upload('user_videos/$userId/$fileName', videoFile);
    final publicUrl = supabaseStorage.from('videos').getPublicUrl(fileName);
    return publicUrl;
  }
}
