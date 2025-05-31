abstract class UploadVideoState {}

class UploadVideoInitial extends UploadVideoState {}

class UploadVideoSuccess extends UploadVideoState {
  final String succMessage;
  final String videoFile;

  UploadVideoSuccess(this.videoFile, {required this.succMessage});
}

class UploadVideoFailure extends UploadVideoState {
  final String errMessage;

  UploadVideoFailure({required this.errMessage});
}

class UploadVideoLoading extends UploadVideoState {}
