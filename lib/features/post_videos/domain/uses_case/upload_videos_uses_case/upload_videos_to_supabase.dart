import 'dart:io';

import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/repo/upload_video_to_supabase_repo.dart';

class UploadVideosToSubaBaseUsesCase extends UsesCase<String, File> {
  final UploadVideoToSupabaseRepo uploadVideoToSupabaseRepo;

  UploadVideosToSubaBaseUsesCase(this.uploadVideoToSupabaseRepo);
  @override
  Future<String> call([File? videoUrl]) async {
    if (videoUrl == null) throw Exception("videoUrl is required");
    return await uploadVideoToSupabaseRepo.uploadVideoToSupabase(
      videoUrl: videoUrl,
    );
  }
}
