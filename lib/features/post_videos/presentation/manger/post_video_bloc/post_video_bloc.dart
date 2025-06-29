import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_video_to_supabase_from_gallery_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/upload_videos_use_cases/upload_videos_from_camera_to_supabase_use_case.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/post_video_bloc/bost_video_state.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/post_video_bloc/post_video_event.dart';

class PostVideoBloc extends Bloc<PostVideoEvent, PostVideoBlocState> {
  final UploadVideosFromCameraToSubaBaseUseCase camera;
  final UploadVideosFromGalleryToSubaBaseUsesCase gallery;

  PostVideoBloc(this.camera, this.gallery) : super(const PostVideoBlocState()) {
    //-post from camera
    on<PostVideoFromCameraEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: BlocStatus.loading));
        await camera.call(event.video);
        emit(
          state.copyWith(
            status: BlocStatus.success,
            succMessage: '🎉 Video uploaded successfully.',
          ),
        );
      } catch (e) {
        emit(state.copyWith(status: BlocStatus.fail, errMessage: e.toString()));
      }
    });
    //-post From Gallery
    on<PostVideoFromGalleryEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: BlocStatus.loading));
        await camera.call();
        emit(
          state.copyWith(status: BlocStatus.success, succMessage: 'Loading...'),
        );
      } catch (e) {
        emit(state.copyWith(status: BlocStatus.fail, errMessage: e.toString()));
      }
    });
  }
}
