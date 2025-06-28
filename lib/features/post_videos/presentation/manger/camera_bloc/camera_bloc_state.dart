import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/core/enums/bloc_status.dart';
import 'package:tiktok_clone/core/enums/camera_enum.dart';

class CameraBlocState extends Equatable {
  final CameraStatus status;
  final String? videoPath;
  final CameraController? controller;

  const CameraBlocState({
    this.controller,
    this.status = CameraStatus.loading,
    this.videoPath,
  });
  CameraBlocState copyWith({
    CameraStatus? status,
    String? videoPath,
    CameraController? controller,
  }) {
    return CameraBlocState(
      status: status ?? this.status,
      videoPath: videoPath ?? this.videoPath,
      controller: controller ?? this.controller,
    );
  }

  @override
  List<Object?> get props => [status, videoPath, controller];
}
