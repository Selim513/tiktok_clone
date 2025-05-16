import 'package:camera/camera.dart';

abstract class CameraRemoteDataSource {
  Future<void> initCamera();
  Future<void> startRecording();
  Future<XFile> stopRecording();
}

class CameraRemoteDataSourceImpl extends CameraRemoteDataSource {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  // final bool _isRecording = false;
  late List<CameraDescription> _cameras;
  @override
  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras.first, ResolutionPreset.high);

    _initializeControllerFuture = _controller.initialize();
    await _initializeControllerFuture;
  }

  @override
  Future<void> startRecording() async {
    if (!_controller.value.isInitialized) return;
    if (_controller.value.isRecordingVideo) return;

    await _controller.startVideoRecording();
  }

  @override
  Future<XFile> stopRecording() async {
    if (!_controller.value.isRecordingVideo) {
      throw Exception('No video is being recorded');
    }

    try {
      final file = await _controller.stopVideoRecording();
      return file;
    } catch (e) {
      throw Exception('Failed to stop recording: $e');
    }
  }
}
