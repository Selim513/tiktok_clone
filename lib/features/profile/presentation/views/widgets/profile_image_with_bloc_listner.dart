import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_cubit.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_state.dart';

class ProfileImageWithBlocListner extends StatefulWidget {
  const ProfileImageWithBlocListner({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  State<ProfileImageWithBlocListner> createState() =>
      _ProfileImageWithBlocListnerState();
}

class _ProfileImageWithBlocListnerState
    extends State<ProfileImageWithBlocListner> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PickProfileImageCubit, PickProfileImageState>(
      listener: (context, state) {
        if (state is PickProfileImageSuccess) {
          print("------------------------${state.imageUrl}");
          CustomSnackBar.successSnackBar(context, message: state.succMessage);
        } else if (state is PickProfileImageFailure) {
          CustomSnackBar.errorSnackBar(context, message: state.errMessage);
        }
      },
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 80,
        backgroundImage:
            widget.imageUrl != null
                ? NetworkImage(widget.imageUrl!)
                : AssetImage('assets/images/profile.png') as ImageProvider,
      ),
    );
  }
}
