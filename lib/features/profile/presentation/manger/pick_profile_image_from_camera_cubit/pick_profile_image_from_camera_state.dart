abstract class PickImageFromCameraState {}

class PickImageFromCameraInitial extends PickImageFromCameraState {}

class PickImageFromCameraSuccess extends PickImageFromCameraState {
  final String succMessage;
  final String? imageUrl;

  PickImageFromCameraSuccess({
    required this.imageUrl,
    required this.succMessage,
  });
}

class PickImageFromCameraFailure extends PickImageFromCameraState {
  final String errMessage;

  PickImageFromCameraFailure({required this.errMessage});
}

class PickImageFromCameraLoading extends PickImageFromCameraState {}

class PickImageFromCamerCancle extends PickImageFromCameraState {}
