import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/camera_record/domain/uses_case/init_camera_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/domain/uses_case/start_record_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/domain/uses_case/stop_record_uses_case.dart';
import 'package:tiktok_clone/features/camera_record/presentation/manger/camera_cubit/camera_satte.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit(
    this.initCameraUsesCase,
    this.startRecordUsesCase,
    this.stopRecordUsesCase,
  ) : super(CameraInitial());
  final InitCameraUsesCase initCameraUsesCase;
  final StartRecordUsesCase startRecordUsesCase;
  final StopRecordUsesCase stopRecordUsesCase;
  Future<void> initCamera() async {
    emit(CameraLoading());
    try {
      await initCameraUsesCase.call();
      emit(CameraInitializing());
    } catch (e) {
      emit(CameraFailure(e.toString()));
    }
  }

  Future<void> startRecording() async {
    emit(CameraLoading());
    try {
      await startRecordUsesCase.call();
      emit(CameraRecordingStarted());
    } catch (e) {
      emit(CameraFailure(e.toString()));
    }
  }

  Future<void> stopRecording() async {
    emit(CameraLoading());
    try {
      var video = await stopRecordUsesCase.call();
      emit(CameraRecordingStopped(video.path));
    } catch (e) {
      emit(CameraFailure(e.toString()));
    }
  }
}
