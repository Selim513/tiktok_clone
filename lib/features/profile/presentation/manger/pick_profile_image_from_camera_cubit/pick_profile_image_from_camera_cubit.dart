import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_image_from_gallery.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_profile_image_use_case.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_state.dart';

class PickProfileImageCubit extends Cubit<PickProfileImageState> {
  PickProfileImageCubit(
    this.pickProfileImageFromCameraUseCase,
    this.pickProfileImageFromGalleryUseCase,
  ) : super(PickProfileImageInitial());
  final PickProfileImageFromCameraUseCase pickProfileImageFromCameraUseCase;
  final PickProfileImageFromGalleryUseCase pickProfileImageFromGalleryUseCase;

  pickProfileImageFromCamera() async {
    try {
      emit(PickProfileImageLoading());

      String? imageUrl = await pickProfileImageFromCameraUseCase.call();
      if (imageUrl == '') {
        emit(PickProfileImageCancle());
      } else {
        emit(
          PickProfileImageSuccess(
            imageUrl: imageUrl,
            succMessage: 'Image has been  updated .',
          ),
        );
      }
    } catch (e) {
      emit(PickProfileImageFailure(errMessage: 'Error ${e.toString()}'));
    }
  }

  pickProfileImageFromGallery() async {
    try {
      emit(PickProfileImageLoading());

      String? imageUrl = await pickProfileImageFromGalleryUseCase.call();
      if (imageUrl == '') {
        emit(PickProfileImageCancle());
      } else {
        emit(
          PickProfileImageSuccess(
            imageUrl: imageUrl,
            succMessage: 'Image has been  updated .',
          ),
        );
      }
    } catch (e) {
      emit(PickProfileImageFailure(errMessage: 'Error ${e.toString()}'));
    }
  }
}
