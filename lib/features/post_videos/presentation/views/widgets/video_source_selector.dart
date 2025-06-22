import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/upload_videos_cubit/upload_video_from_gallery/upload_video_from_gallery_cubit.dart';
import 'package:tiktok_clone/features/post_videos/presentation/manger/upload_videos_cubit/upload_video_from_gallery/upload_video_from_gallery_state.dart';

class VideoSourceSelector extends StatelessWidget {
  const VideoSourceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(20),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            widget: Text('Camera Shot', style: AppFontstyle.fontStyle20),
            onPress: () {
              GoRouter.of(context).pushNamed(AppRouter.kCameraRecord);
            },
          ),
          BlocListener<
            UploadVideoFromGalleryCubit,
            UploadVideosFromGallerySatate
          >(
            listener: (context, state) {
              if (state is UploadSuccess) {
                CustomSnackBar.successSnackBar(
                  context,
                  message: state.succMessage,
                );
              } else if (state is UploadCanceld) {
              } else if (state is UploadFailure) {
                CustomSnackBar.errorSnackBar(
                  context,
                  message: state.errMessage,
                 
                );
              } else {
                CustomSnackBar.successSnackBar(context, message: 'loading...');
              }
            },
            child: CustomElevatedButton(
              widget: Text('From Gallery', style: AppFontstyle.fontStyle20),
              onPress: () async {
                await context
                    .read<UploadVideoFromGalleryCubit>()
                    .uploadVideosFromGallery();
              },
            ),
          ),
        ],
      ),
    );
  }
}
