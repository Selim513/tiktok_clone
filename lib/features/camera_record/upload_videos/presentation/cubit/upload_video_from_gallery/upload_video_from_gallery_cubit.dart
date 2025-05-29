import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/domain/uses_case/upload_video_to_supabase_from_gallery.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/presentation/cubit/upload_video_from_gallery/upload_video_from_gallery_state.dart';

class UploadVideoFromGalleryCubit extends Cubit<UploadVideosFromGallerySatate> {
  UploadVideoFromGalleryCubit(this.uploadVideosToSubaBaseFromGalleryUsesCase)
    : super(InitialUploadFromGallery());
  final UploadVideosToSubaBaseFromGalleryUsesCase
  uploadVideosToSubaBaseFromGalleryUsesCase;
  uploadVideosFromGallery() async {
    try {
      emit(UploadLoading());
      await uploadVideosToSubaBaseFromGalleryUsesCase.call();
      emit(UploadSuccess(succMessage: 'The video has been posted'));
    } catch (e) {
      final errorMessage = e.toString();

      if (errorMessage.contains('UploadCancelled')) {
        emit(UploadCanceld());
      } else {
        emit(
          UploadFailure(errMessage: 'There is some thong went Wrong=====$e'),
        );
      }
      print('============================ ${e.toString()}------------$e');
    }
  }
}
