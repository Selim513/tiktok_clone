import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_state.dart';

class PickProfileImageFromCameraCubit extends Cubit<PickImageFromCameraState> {
  PickProfileImageFromCameraCubit(this.pickProfileImageUseCase)
    : super(PickImageFromCameraInitial());
  final PickProfileImageFromCameraUseCase pickProfileImageUseCase;

  pickProfileImageFromCamera() async {
    try {
      emit(PickImageFromCameraLoading());
      String imageUrl = await pickProfileImageUseCase.call();
      emit(
        PickImageFromCameraSuccess(
          imageUr: imageUrl,
          succMessage: 'Image has been updated .',
        ),
      );
    } catch (e) {
      emit(PickImageFromCameraFailure(errMessage: 'Error ${e.toString()}'));
    }
  }
}
