import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final name = user?.userMetadata?['Name'];
    final useProfile = user?.userMetadata?['picture'] as String?;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(name ?? 'user', style: AppFontstyle.fontStyle20)],
        ),
        Gap(50),
        BlocConsumer<PickProfileImageFromCameraCubit, PickImageFromCameraState>(
          listener: (context, state) {
            if (state is PickImageFromCameraSuccess) {
              CustomSnackBar.successSnackBar(
                context,
                message: state.succMessage,
              );
            } else if (state is PickImageFromCameraFailure) {
              CustomSnackBar.successSnackBar(
                context,
                message: state.errMessage,
                isSuccess: false,
              );
            }
          },
          builder: (context, state) {
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
                    state is PickImageFromCameraSuccess && useProfile != null
                        ? NetworkImage(useProfile)
                        : AssetImage('assets/images/profile.png'),
              ),
            );
          },
        ),
        Gap(30),
        Text('My Vedios', style: AppFontstyle.fontStyle30),
        CustomElevatedButton(
          widget: Text('Log out', style: AppFontstyle.fontStyle20),
          onPress: () async {
            await Supabase.instance.client.auth.signOut().then((value) {
              GoRouter.of(context).goNamed(AppRouter.kAuth);
            });
          },
        ),
      ],
    );
  }
}
