import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/post_video_bloc/bost_video_state.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/post_video_bloc/post_video_bloc.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/post_video_bloc/post_video_event.dart';

class VideoPreviewActionsButtons extends StatelessWidget {
  const VideoPreviewActionsButtons({super.key, required this.vedioFile});
  final File vedioFile;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PostVideoBloc, PostVideoBlocState>(
      listener: (context, state) {
        if (state.status == BlocStatus.success) {
          CustomSnackBar.successSnackBar(context, message: state.succMessage!);
          GoRouter.of(context).pop();
        } else if (state.status == BlocStatus.fail) {
          CustomSnackBar.errorSnackBar(context, message: state.errMessage!);
        }
      },
      child: Padding(
        padding: const EdgeInsetsGeometry.all(20),
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
                    style: AppFontstyle.normal20.copyWith(color: Colors.black),
                  ),
                  onPress: () {
                    GoRouter.of(context).goNamed(AppRouter.kCameraRecord);
                  },
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  widget: Text('Post', style: AppFontstyle.normal20),
                  onPress: () {
                    print('Caaam-----${vedioFile.path}');
                    context.read<PostVideoBloc>().add(
                      PostVideoFromCameraEvent(video: vedioFile),
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
