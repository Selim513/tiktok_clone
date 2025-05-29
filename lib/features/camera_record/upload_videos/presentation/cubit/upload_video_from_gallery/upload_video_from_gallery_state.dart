abstract class UploadVideosFromGallerySatate {}

class InitialUploadFromGallery extends UploadVideosFromGallerySatate {}

class UploadSuccess extends UploadVideosFromGallerySatate {
  final String succMessage;

  UploadSuccess({required this.succMessage});
}

class UploadFailure extends UploadVideosFromGallerySatate {
  final String errMessage;

  UploadFailure({required this.errMessage});
}

class UploadLoading extends UploadVideosFromGallerySatate {}

class UploadCanceld extends UploadVideosFromGallerySatate {}
