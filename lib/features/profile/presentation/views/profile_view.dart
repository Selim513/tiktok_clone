import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/pick_profile_image_use_case.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? name;
  String? imageUrl;
  @override
  void initState() {
    super.initState();
    final user = Supabase.instance.client.auth.currentUser;
    name = user?.userMetadata?['Name'];
    imageUrl = user?.userMetadata?['picture'] as String?;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => PickProfileImageFromCameraCubit(
                getIt.get<PickProfileImageFromCameraUseCase>(),
              ),
        ),
      ],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(name ?? 'user', style: AppFontstyle.fontStyle20)],
          ),
          Gap(50),
          BlocConsumer<
            PickProfileImageFromCameraCubit,
            PickImageFromCameraState
          >(
            listener: (context, state) {
              if (state is PickImageFromCameraSuccess) {
                CustomSnackBar.successSnackBar(
                  context,
                  message: state.succMessage,
                );
                print('============${state.imageUr}');
              } else if (state is PickImageFromCameraFailure) {
                CustomSnackBar.errorSnackBar(
                  context,
                  message: state.errMessage,
                );
              }
            },
            builder: (context, state) {
              if (state is PickImageFromCameraSuccess) {
                imageUrl = state.imageUr;
                return GestureDetector(
                  onTap: () async {
                    await context
                        .read<PickProfileImageFromCameraCubit>()
                        .pickProfileImageFromCamera();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 80,
                    backgroundImage:
                        imageUrl != null
                            ? NetworkImage(imageUrl!)
                            : AssetImage('assets/images/profile.png'),
                  ),
                );
              } else if (state is PickImageFromCameraLoading) {
                return CircularProgressIndicator();
              } else {
                return GestureDetector(
                  onTap: () async {
                    await context
                        .read<PickProfileImageFromCameraCubit>()
                        .pickProfileImageFromCamera();
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                );
              }
            },
          ),
          Gap(30),
          Text('My Videos', style: AppFontstyle.fontStyle30),
          CustomElevatedButton(
            widget: Text('Log out', style: AppFontstyle.fontStyle20),
            onPress: () async {
              await Supabase.instance.client.auth.signOut().then((value) {
                GoRouter.of(context).goNamed(AppRouter.kAuth);
              });
            },
          ),
        ],
      ),
    );
  }
}
