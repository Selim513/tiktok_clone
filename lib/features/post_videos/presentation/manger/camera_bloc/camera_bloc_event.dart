import 'package:equatable/equatable.dart';

abstract class CameraBlocEvent extends Equatable {}

class CameraInitialEvent extends CameraBlocEvent {
  @override
  List<Object?> get props => [];
}

class CameraStartRecordingEvent extends CameraBlocEvent {
  @override
  List<Object?> get props => [];
}

class CameraStopRecordingEvent extends CameraBlocEvent {
  @override
  List<Object?> get props => [];
}

class CameraDisposeEvent extends CameraBlocEvent {
  @override
  List<Object?> get props => [];
}
