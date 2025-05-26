import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/presentation/manger/camera_cubit/camera_cubit.dart';
import 'package:tiktok_clone/features/camera_record/camera_recording/presentation/manger/camera_cubit/camera_satte.dart';
import 'package:tiktok_clone/features/camera_record/upload_videos/presentation/views/video_preview.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          BlocConsumer<CameraCubit, CameraState>(
            builder: (context, state) {
              if (state is CameraInitializing) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          context.read<CameraCubit>().startRecording();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Icon(
                            Icons.videocam,
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else if (state is CameraRecordingStarted) {
                return Column(
                  children: [
                    CameraPreview(context.read<CameraCubit>().controller),
                    Padding(
                      padding: EdgeInsetsGeometry.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          context.read<CameraCubit>().stopRecording();
                        },
                        child: Icon(Icons.camera_alt_sharp),
                      ),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
            listener: (context, state) {
              if (state is CameraRecordingStopped) {
                context.read<CameraCubit>().disposeCamera();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder:
                //         (context) => VideoPreview(videoPath: state.videoPath),
                //   ),
                // );
                GoRouter.of(
                  context,
                ).goNamed(AppRouter.kCameraPreviw, extra: state.videoPath);
              }
            },
          ),
        ],
      ),
    );
  }
}
