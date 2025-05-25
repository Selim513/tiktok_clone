import 'package:camera/camera.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/data/data_source/camera_remote_data_source.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/domain/repo/camera_repo.dart';

class CameraRepoImpl extends CameraRepo {
  final CameraRemoteDataSource cameraRemoteDataSource;

  CameraRepoImpl(this.cameraRemoteDataSource);

  @override
  Future<void> initCamera() async {
    try {
      await cameraRemoteDataSource.initCamera();
    } on Exception catch (e) {
      throw Exception('There is an error happend ${e.toString()}');
    }
  }

  @override
  Future<void> startRecording() async {
    try {
      await cameraRemoteDataSource.startRecording();
    } on Exception catch (e) {
      throw Exception('There is an error happend ${e.toString()}');
    }
  }

  @override
  Future<XFile> stopRecording() async {
    try {
      var file = await cameraRemoteDataSource.stopRecording();
      
      return file;
    } on Exception catch (e) {
      throw Exception('There is an error happend ${e.toString()}');
    }
  }

  @override
  Future<void> disposeCamera() async {
    try {
      await cameraRemoteDataSource.disposeCamera();
    } catch (e) {
      throw Exception('Error disposing camera: ${e.toString()}');
    }
  }

  @override
  CameraController get controller => cameraRemoteDataSource.controller;
}
