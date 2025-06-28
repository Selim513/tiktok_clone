import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/camera_enum.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/dispose_camera_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/init_camera_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/start_record_use_case.dart';
import 'package:tiktok_clone/features/post_videos/domain/use_cases/camera_use_cases/stop_record_use_case.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/camera_bloc/camera_bloc_event.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/camera_bloc/camera_bloc_state.dart';

class CameraBloc extends Bloc<CameraBlocEvent, CameraBlocState> {
  final InitCameraUsesCase camInit;
  final StartRecordUsesCase camStart;
  final StopRecordUsesCase camStop;
  final DisposeCameraUsesCase dispose;

  CameraBloc(this.camInit, this.camStart, this.camStop, this.dispose)
    : super(const CameraBlocState()) {
    //-Init Camera
    on<CameraInitialEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: CameraStatus.loading));

        await camInit.call();
        final controller = camInit.cameraRepo.controller;
        emit(
          state.copyWith(status: CameraStatus.initial, controller: controller),
        );
      } catch (e) {
        emit(state.copyWith(status: CameraStatus.fail));
      }
    });
    //-Start Record
    on<CameraStartRecordingEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: CameraStatus.loading));

        await camStart.call();
        final controller = camInit.cameraRepo.controller;

        emit(
          state.copyWith(
            status: CameraStatus.startRedcord,
            controller: controller,
          ),
        );
      } catch (e) {
        emit(state.copyWith(status: CameraStatus.fail));
      }
    });
    //-Stop Record
    on<CameraStopRecordingEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: CameraStatus.loading));

        final video = await camStop.call();
        final controller = camInit.cameraRepo.controller;

        emit(
          state.copyWith(
            status: CameraStatus.stopRecord,
            videoPath: video.path,
            controller: controller,
          ),
        );
      } catch (e) {
        emit(state.copyWith(status: CameraStatus.fail));
      }
    });
    //-dispose camera
    on<CameraDisposeEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: CameraStatus.loading));

      await dispose.call();

        emit(
          state.copyWith(
            status: CameraStatus.loading,
            
            
          ),
        );
      } catch (e) {
        emit(state.copyWith(status: CameraStatus.fail));
      }
    });
  }
}
