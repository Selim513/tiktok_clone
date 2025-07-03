import 'dart:io';

import 'package:tiktok_clone/core/errors/errors.dart';
import 'package:tiktok_clone/features/post_videos/data/data_source/upload_video_to_supabase_remote_data_source.dart';
import 'package:tiktok_clone/features/post_videos/domain/repo/upload_video_to_supabase_repo.dart';

class UploadVideoToSupabaseRepoImpl extends UploadVideoToSupabaseRepo {
  final UploadVideoToSupabaseRemoteDataSourceImpl
  uploadVideoToSupabaseRemoteDataSourceImpl;

  UploadVideoToSupabaseRepoImpl(this.uploadVideoToSupabaseRemoteDataSourceImpl);
  @override
  Future<String> uploadVideoFromCamraToSupabase({
    required File videoUrl,
  }) async {
    try {
      var videoFile = await uploadVideoToSupabaseRemoteDataSourceImpl
          .uploadVideoFromCameraToSupaBase(videoUrl: videoUrl);
      return videoFile;
    } catch (e) {
      throw extractErrorMessage('---- ${e.toString()}');
    }
  }

  @override
  Future<String> uploadVideoToSubaBaseFromGallery() async {
    try {
      var videoFile =
          await uploadVideoToSupabaseRemoteDataSourceImpl
              .uploadVideoToSubaBaseFromGallery();
      return videoFile;
    } catch (e) {
      throw extractErrorMessage(e);
    }
  }
}
