import 'package:camera/camera.dart';

abstract class CameraRepo {
  Future<void> initCamera();
  Future<void> startRecording();
  Future<XFile> stopRecording();
  Future<void> disposeCamera();
  CameraController get controller;
}
