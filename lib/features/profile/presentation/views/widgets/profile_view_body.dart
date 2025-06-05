import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/utils/function_helper.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_state.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(name ?? 'user', style: AppFontstyle.fontStyle20)],
        ),
        Gap(50),

        GestureDetector(
          onTap: () async {
            final cubit = BlocProvider.of<PickProfileImageCubit>(
              context,
              listen: false,
            );
            await customShowDialogPickImageSourceOptions(context, cubit);
          },
          child: BlocListener<PickProfileImageCubit, PickProfileImageState>(
            listener: (context, state) {
              if (state is PickProfileImageSuccess) {
                print("------------------------${state.imageUrl}");
                CustomSnackBar.successSnackBar(
                  context,
                  message: state.succMessage,
                );
              } else if (state is PickProfileImageFailure) {
                CustomSnackBar.errorSnackBar(
                  context,
                  message: state.errMessage,
                );
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 80,
              backgroundImage:
                  imageUrl != null
                      ? NetworkImage(imageUrl!)
                      : AssetImage('assets/images/profile.png')
                          as ImageProvider,
            ),
          ),
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
    );
  }
}
