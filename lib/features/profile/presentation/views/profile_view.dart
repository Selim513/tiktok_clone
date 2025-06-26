import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/features/profile/data/data_soruce/fetch_user_info_remote_data_source/fetch_user_info_remote_data_source.dart';
import 'package:tiktok_clone/features/profile/data/repo/fetch_user_info_repo_impl.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => FetchUserInfoBloc(
                FetchUserInfoUseCase(
                  FetchUserInfoRepoImpl(FetchUserInfoRemoteDataSourceImpl()),
                ),
              )..add(FetchUserInfoEvent()),
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
    );
  }
}
