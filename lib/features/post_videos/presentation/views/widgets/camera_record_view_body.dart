import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/enums/camera_enum.dart';
import 'package:tiktok_clone/core/utils/app_color.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/camera_bloc/camera_bloc.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/camera_bloc/camera_bloc_event.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/camera_bloc/camera_bloc_state.dart';

class CameraRecordViewBody extends StatefulWidget {
  const CameraRecordViewBody({super.key});

  @override
  State<CameraRecordViewBody> createState() => _CameraRecordViewBodyState();
}

class _CameraRecordViewBodyState extends State<CameraRecordViewBody> {
  @override
  void initState() {
    context.read<CameraBloc>().add(CameraInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraBloc, CameraBlocState>(
      builder: (context, state) {
        if (state.status == CameraStatus.loading || state.controller == null) {
          return Container(
            color: Colors.black,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        final isRecording = state.status == CameraStatus.startRedcord;
        return CustomCameraRecodingBody(
          cameraBackGroundColor:
              isRecording ? AppColors.redColor : AppColors.whiteColor,
          cameraController: state.controller!,

          onTap: () {
            if (isRecording) {
              context.read<CameraBloc>().add(CameraStopRecordingEvent());
            } else {
              context.read<CameraBloc>().add(CameraStartRecordingEvent());
            }
          },
        );
      },
      listener: (context, state) {
        if (state.status == CameraStatus.stopRecord) {
          GoRouter.of(
            context,
          ).goNamed(AppRouter.kPickedVideoPreviw, extra: state.videoPath);
          context.read<CameraBloc>().add(CameraDisposeEvent());
        }
      },
    );
  }
}

//-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-///-/-/-/-/-/-/-/-/--/-/-/-///-
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
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(child: CameraPreview(cameraController)),
            GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                backgroundColor: cameraBackGroundColor ?? Colors.white,
                radius: 30.sp,
                child: Icon(Icons.videocam, color: Colors.black, size: 40.sp),
              ),
            ),
          ],
        ),
      ),
    ); // SafeArea(
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
    //             radiu
  }
}
