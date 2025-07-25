import 'package:tiktok_clone/core/uses_case/uses_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/repo/upload_video_to_supabase_repo.dart';

class UploadVideosFromGalleryToSubaBaseUsesCase extends UsesCase<String, void> {
  final UploadVideoToSupabaseRepo uploadVideoToSupabaseRepo;

  UploadVideosFromGalleryToSubaBaseUsesCase(this.uploadVideoToSupabaseRepo);
  @override
  Future<String> call([void _]) async {
    return await uploadVideoToSupabaseRepo.uploadVideoToSubaBaseFromGallery();
  }
}
