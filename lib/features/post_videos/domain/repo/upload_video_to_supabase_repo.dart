import 'dart:io';

abstract class UploadVideoToSupabaseRepo {
  Future<String> uploadVideoFromCamraToSupabase({required File videoUrl});
  Future<String> uploadVideoToSubaBaseFromGallery();
}
