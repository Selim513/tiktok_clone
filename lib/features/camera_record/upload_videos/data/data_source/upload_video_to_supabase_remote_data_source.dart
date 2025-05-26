import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/services/generate_unique_file_name.dart';

abstract class UploadVideoToSupabaseRemoteDataSource {
  Future<String> uploadVideoToSupaBase({required File videoUrl});
}

class UploadVideoToSupabaseRemoteDataSourceImpl
    extends UploadVideoToSupabaseRemoteDataSource {
  @override
  Future<String> uploadVideoToSupaBase({required File videoUrl}) async {
    final SupabaseStorageClient supabaseStorage =
        Supabase.instance.client.storage;
    final fileName = generateUniqueFileName(videoUrl.path);
    await supabaseStorage
        .from('videos')
        .upload('user_videos/$fileName', videoUrl);
    final publicUrl = supabaseStorage.from('videos').getPublicUrl(fileName);
    return publicUrl;
  }
}
