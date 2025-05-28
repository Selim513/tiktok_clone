import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/domain/uses_case/upload_videos_to_supabase.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/presentation/cubit/upload_video_state.dart';

class UploadVideoCubit extends Cubit<UploadVideoState> {
  UploadVideoCubit(this.uploadVideosToSubaBase) : super(UploadVideoInitial());
  final UploadVideosToSubaBaseUsesCase uploadVideosToSubaBase;

  void uploadVideosToSupaBase({required File videoFile}) async {
    try {
      emit(UploadVideoLoading());
      await uploadVideosToSubaBase(videoFile);
      emit(
        UploadVideoSuccess(
          succMessage: 'Video has Been Uploaded',
          videoFile.path,
        ),
      );
    } catch (e) {
      emit(UploadVideoFailure(errMessage: 'errMessage=== ${e.toString()}'));
    }
  }
}
