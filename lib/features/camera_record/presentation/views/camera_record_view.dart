import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/camera_record/presentation/manger/camera_cubit/camera_cubit.dart';
import 'package:tiktok_clone/features/camera_record/presentation/manger/camera_cubit/camera_satte.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CameraCubit, CameraState>(
        builder: (context, state) {
          if (state is CameraLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CameraInitializing) {
            return Center(
              child: Text(
                'Camera Initialized, Ready to Record',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (state is CameraRecordingStarted) {
            return Stack(
              children: [
                Center(
                  child: Text(
                    'Recording...',
                    style: TextStyle(color: Colors.red, fontSize: 24),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      context.read<CameraCubit>().stopRecording();
                    },
                    child: Icon(Icons.stop),
                  ),
                ),
              ],
            );
          } else if (state is CameraRecordingStopped) {
            return Center(
              child: Text(
                'Video recorded at:\n${state.videoPath}',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            );
          } else if (state is CameraFailure) {
            return Center(
              child: Text(
                'Error: ${state.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<CameraCubit>().initCamera();
              },
              child: Text('Initialize Camera'),
            ),
          );
        },
      ),
      floatingActionButton: BlocBuilder<CameraCubit, CameraState>(
        builder: (context, state) {
          if (state is CameraInitializing || state is CameraRecordingStopped) {
            return FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                context.read<CameraCubit>().startRecording();
              },
              child: Icon(Icons.videocam, color: Colors.black),
            );
          }
          return Container();
        },
      ),
    );
  }
}
