abstract class CameraState {}

class CameraInitial extends CameraState {}

class CameraInitializing extends CameraState {}

class CameraRecordingStarted extends CameraState {}

class CameraRecordingStopped extends CameraState {
  final String videoPath; 
  CameraRecordingStopped(this.videoPath);
}

class CameraLoading extends CameraState {}

class CameraFailure extends CameraState {
  final String error;
  CameraFailure(this.error);
}
