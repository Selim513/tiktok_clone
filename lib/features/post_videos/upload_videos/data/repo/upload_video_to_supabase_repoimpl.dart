import 'dart:io';

import 'package:tiktok_clone/features/post_videos/upload_videos/data/data_source/upload_video_to_supabase_remote_data_source.dart';
import 'package:tiktok_clone/features/post_videos/upload_videos/domain/repo/upload_video_to_supabase_repo.dart';

class UploadVideoToSupabaseRepoimpl extends UploadVideoToSupabaseRepo {
  final UploadVideoToSupabaseRemoteDataSourceImpl
  uploadVideoToSupabaseRemoteDataSourceImpl;

  UploadVideoToSupabaseRepoimpl(this.uploadVideoToSupabaseRemoteDataSourceImpl);
  @override
  Future<String> uploadVideoToSupabase({required File videoUrl}) async {
    try {
      var videoFile = await uploadVideoToSupabaseRemoteDataSourceImpl
          .uploadVideoToSupaBase(videoUrl: videoUrl);
      return videoFile;
    } catch (e) {
      throw Exception('---- ${e.toString()}');
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
           
      throw Exception('----ErorVideosUpload ${e.toString()}');
    }
  }
}
