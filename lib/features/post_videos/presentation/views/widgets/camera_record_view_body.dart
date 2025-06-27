import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/utils/app_color.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/camera_cubit/camera_cubit.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/camera_cubit/camera_satte.dart';

class CameraRecordViewBody extends StatefulWidget {
  const CameraRecordViewBody({super.key});

  @override
  State<CameraRecordViewBody> createState() => _CameraRecordViewBodyState();
}

class _CameraRecordViewBodyState extends State<CameraRecordViewBody> {
  CameraController? controller;
  @override
  void initState() {
    // context.read<CameraCubit>().initCamera();
    super.initState();

    controller = context.read<CameraCubit>().controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraCubit, CameraState>(
      builder: (context, state) {
        if (state is CameraInitializing) {
          return CustomCameraRecodingBody(
            cameraController: controller!,

            onTap: () => context.read<CameraCubit>().startRecording(),
          );
        } else if (state is CameraRecordingStarted) {
          return CustomCameraRecodingBody(
            cameraController: controller!,

            cameraBackGroundColor: AppColors.redColor,
            onTap: () => context.read<CameraCubit>().stopRecording(),
          );

          // SafeArea(
          //   child: Column(
          //     children: [
          //       CameraPreview(context.read<CameraCubit>().controller),
          //       Padding(
          //         padding: const EdgeInsetsGeometry.only(bottom: 20),
          //         child: GestureDetector(
          //           onTap: () {
          //             context.read<CameraCubit>().stopRecording();
          //           },
          //           child: const CircleAvatar(
          //             backgroundColor: Colors.white,
          //             radius: 30,
          //             child: Icon(Icons.videocam, color: Colors.red, size: 40),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        } else {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          );
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
          ).goNamed(AppRouter.kPickedVideoPreviw, extra: state.videoPath);
        }
      },
    );
  }
}

class CustomCameraRecodingBody extends StatelessWidget {
  const CustomCameraRecodingBody({
    super.key,
    required this.cameraController,
    this.onTap,
    this.cameraBackGroundColor,
  });
  final CameraController cameraController;
  final void Function()? onTap;
  final Color? cameraBackGroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(child: CameraPreview(cameraController)),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: cameraBackGroundColor ?? Colors.white,
              radius: 30,
              child: const Icon(Icons.videocam, color: Colors.black, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
