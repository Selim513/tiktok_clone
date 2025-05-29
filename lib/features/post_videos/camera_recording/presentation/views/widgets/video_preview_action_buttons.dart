import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/post_videos/upload_videos/presentation/cubit/upload_from_camera/upload_video_cubit.dart';
import 'package:tiktok_clone/features/post_videos/upload_videos/presentation/cubit/upload_from_camera/upload_video_state.dart';

class VideoPreviewActionsButtons extends StatelessWidget {
  const VideoPreviewActionsButtons({super.key, required this.vedioFile});
  final File vedioFile;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadVideoCubit, UploadVideoState>(
      listener: (context, state) {
        if (state is UploadVideoSuccess) {
          CustomSnackBar.successSnackBar(context, message: state.succMessage);
          GoRouter.of(context).pop();
        } else if (state is UploadVideoFailure) {
          CustomSnackBar.successSnackBar(
            context,
            message: state.errMessage,
            isSuccess: false,
          );
        }
      },
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Row(
            spacing: 20,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  color: Colors.white,
                  widget: Text(
                    'Another Shot',
                    textAlign: TextAlign.center,
                    style: AppFontstyle.fontStyle20.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  onPress: () {
                    GoRouter.of(context).goNamed(AppRouter.kCameraRecord);
                  },
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  widget: Text('Post', style: AppFontstyle.fontStyle20),
                  onPress: () {
                    context.read<UploadVideoCubit>().uploadVideosToSupaBase(
                      videoFile: vedioFile,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
