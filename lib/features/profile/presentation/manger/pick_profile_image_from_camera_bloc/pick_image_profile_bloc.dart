import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_image_from_gallery.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_profile_image_use_case.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_bloc/pick_profile_image_event.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_bloc/pick_profile_image_state.dart';

class PickProfileImageBloc
    extends Bloc<PickProfileImageEvent, PickProfileImageStates> {
  final PickProfileImageFromCameraUseCase cameraUseCase;
  final PickProfileImageFromGalleryUseCase galleryUseCase;
  PickProfileImageBloc(this.cameraUseCase, this.galleryUseCase)
    : super(const PickProfileImageStates()) {
    on<PickProfileImageEvent>((event, emit) async {
      if (event is PickProfileImageFromCameraEvent) {
        try {
          //-Loading
          emit(state.copyWith(status: BlocStatus.loading));
          //-Success
          String? imageUrl = await cameraUseCase.call();
          emit(
            state.copyWith(
              imageUrl: imageUrl,
              succMessage: 'Image Uploading...',
              status: BlocStatus.success,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
              status: BlocStatus.fail,
              errMessage: 'There is some thing went wrong $e',
            ),
          );
        }
      } else if (event is PickProfileImageFromGalleryEvent) {
        try {
          //-Loading
          emit(state.copyWith(status: BlocStatus.loading));
          //-success
          String? imageUrl = await galleryUseCase.call();
          emit(
            state.copyWith(
              imageUrl: imageUrl,

              succMessage: 'Image Uploading...',
              status: BlocStatus.success,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
              status: BlocStatus.fail,
              errMessage: 'There is some thing went wrong $e',
            ),
          );
        }
      }
    });
  }
}
