import 'package:flutter/widgets.dart';
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

class PostVideoViewBody extends StatelessWidget {
  const PostVideoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(20),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            widget: Text('Camera Shot', style: AppFontstyle.normal20),
            onPress: () {
              GoRouter.of(context).pushNamed(AppRouter.kCameraRecord);
            },
          ),
          BlocListener<PostVideoBloc, PostVideoBlocState>(
            listener: (context, state) {
              if (state.status == BlocStatus.success) {
                CustomSnackBar.successSnackBar(
                  context,
                  message: state.succMessage!,
                );
              } else if (state.status == BlocStatus.fail) {
                CustomSnackBar.errorSnackBar(
                  context,
                  message: state.errMessage!,
                );
              } else if (state.status == BlocStatus.loading) {
                CustomSnackBar.confrimEmailSnackBar(
                  context,
                  message: state.loadingMessage!,
                );
              }
            },
            child: CustomElevatedButton(
              widget: Text('From Gallery', style: AppFontstyle.normal20),
              onPress: () async {
                print('Tapp');
                context.read<PostVideoBloc>().add(PostVideoFromGalleryEvent());
              },
            ),
          ),
        ],
      ),
    );
  }
}
