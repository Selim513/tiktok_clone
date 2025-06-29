import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_bloc/pick_image_profile_bloc.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_bloc/pick_profile_image_state.dart';

class ProfileImageWithBlocListner extends StatelessWidget {
  const ProfileImageWithBlocListner({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PickProfileImageBloc, PickProfileImageStates>(
      listener: (context, state) {
        if (state.status == BlocStatus.success) {
          CustomSnackBar.successSnackBar(context, message: state.succMessage!);
        } else if (state.status == BlocStatus.fail) {
          CustomSnackBar.errorSnackBar(context, message: state.errMessage!);
        }
      },
      child: CircleAvatar(
        radius: 80,
        backgroundColor: Colors.grey[200],
        child:
            imageUrl.isEmpty
                ? Image.asset('assets/images/profile.png')
                : ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                    placeholder:
                        (context, url) => const CircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) =>
                            const Icon(Icons.error, size: 50),
                  ),
                ),
      ),
    );
  }
}
