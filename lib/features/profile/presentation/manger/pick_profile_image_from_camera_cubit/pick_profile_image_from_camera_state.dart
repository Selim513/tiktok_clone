abstract class PickProfileImageState {}

class PickProfileImageInitial extends PickProfileImageState {}

class PickProfileImageSuccess extends PickProfileImageState {
  final String succMessage;
  final String? imageUrl;

  PickProfileImageSuccess({required this.imageUrl, required this.succMessage});
}

class PickProfileImageFailure extends PickProfileImageState {
  final String errMessage;

  PickProfileImageFailure({required this.errMessage});
}

class PickProfileImageLoading extends PickProfileImageState {}

class PickProfileImageCancle extends PickProfileImageState {}
