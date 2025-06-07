import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/fetch_my_videos_use_case.dart/fetch_my_videos_use_case.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_image_from_gallery.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_profile_image_use_case.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_my_videos_cubit/fetch_my_videos_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => PickProfileImageCubit(
                getIt.get<PickProfileImageFromCameraUseCase>(),
                getIt.get<PickProfileImageFromGalleryUseCase>(),
              ),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchMyVideosCubit(getIt.get<FetchMyVideosUseCase>()),
        ),
      ],

      child: ProfileViewBody(),
    );
  }
}
