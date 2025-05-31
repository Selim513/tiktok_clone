import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_videos_to_supabase_use_case.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/upload_videos_cubit/upload_from_camera/upload_video_state.dart';

class UploadVideoCubit extends Cubit<UploadVideoState> {
  UploadVideoCubit(this.uploadVideosToSubaBase) : super(UploadVideoInitial());
  final UploadVideosToSubaBaseUseCase uploadVideosToSubaBase;

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
