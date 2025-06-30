import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/fetch_my_videos_use_case.dart/fetch_my_videos_use_case.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/fetch_user_info_use_case/fetch_user_info_use_case.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_image_from_gallery.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case/pick_profile_image_use_case.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_my_videos_cubit/fetch_my_videos_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_info_bloc.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_info_event.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_bloc/pick_image_profile_bloc.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouter.kSettingsView);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    FetchUserInfoBloc(getIt.get<FetchUserInfoUseCase>())
                      ..add(FetchUserInfoEvent()),
          ),
          BlocProvider(
            create:
                (context) => PickProfileImageBloc(
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

        child: const ProfileViewBody(),
      ),
    );
  }
}
