import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/utils/function_helper.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_bloc/pick_image_profile_bloc.dart';
import 'package:tiktok_clone/features/profile/presentation/views/widgets/profile_image_with_bloc_listner.dart';

class ProfileViewImage extends StatelessWidget {
  const ProfileViewImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final cubit = context.read<PickProfileImageBloc>();
        await customShowDialogPickImageSourceOptions(context, cubit);
      },
      child: ProfileImageWithBlocListner(imageUrl: imageUrl),
    );
  }
}
