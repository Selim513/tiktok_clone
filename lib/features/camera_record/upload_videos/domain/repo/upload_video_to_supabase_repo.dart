import 'dart:io';

abstract class UploadVideoToSupabaseRepo {
  Future<String> uploadVideoToSupabase({required File videoUrl});
  Future<String> uploadVideoToSubaBaseFromGallery();
}
