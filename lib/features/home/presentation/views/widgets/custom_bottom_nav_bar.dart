import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });
  final int currentIndex;
  final void Function(int index)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      fixedColor: Colors.white,

      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isRecording = false;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  Future<void> _startRecording() async {
    if (!_controller.value.isInitialized) return;

    await _controller.startVideoRecording();
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    if (!_controller.value.isRecordingVideo) return;

    final file = await _controller.stopVideoRecording();
    setState(() {
      _isRecording = false;
    });

    final filePath = file.path;

    try {
      final supabase = Supabase.instance.client;
      final newFileName = 'VID_${DateTime.now().millisecondsSinceEpoch}.mp4';

      final storageResponse = await supabase.storage
          .from('videos') // اسم الباكت اللي أنشأته في Supabase
          .upload(
            'user_videos/$newFileName',
            // المسار داخل الباكت
            File(filePath),
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );

      print('✅ Video uploaded: $storageResponse');
      // تقدر بعد كده تجيب رابط الملف لو محتاج
      final publicUrl = supabase.storage
          .from('videos')
          .getPublicUrl('user_videos/$newFileName');
      print('🔗 Video URL: $publicUrl');
    } catch (e) {
      print('❌ Upload error: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CameraPreview(_controller),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: FloatingActionButton(
                    backgroundColor: _isRecording ? Colors.red : Colors.white,
                    onPressed: () {
                      _isRecording ? _stopRecording() : _startRecording();
                    },
                    child: Icon(
                      _isRecording ? Icons.stop : Icons.videocam,
                      color: _isRecording ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
