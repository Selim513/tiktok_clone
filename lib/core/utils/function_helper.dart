import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/core/widgets/image_picker_option_button.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_cubit/pick_profile_image_from_camera_cubit.dart';

OutlineInputBorder customOutLineBorders({Color? color, double? circular}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(circular ?? 15)),
    borderSide: BorderSide(color: color ?? const Color(0xffE6E6E6)),
  );
}

String obfuscateEmail(String email) {
  final parts = email.split('@');
  if (parts.length != 2) return email;
  final name = parts[0];
  final domain = parts[1];

  if (name.length <= 2) {
    return '${name[0]}***@$domain';
  }

  final first = name[0];
  final last = name[name.length - 1];
  final stars = '*****';

  return '$first$stars$last@$domain';
}

Future<dynamic> customShowDialogPickImageSourceOptions(
  BuildContext context,
  PickProfileImageCubit cubit,
) {
  return showDialog(
    context: context,

    builder:
        (context) => AlertDialog(
          title: Center(child: Text('Select ')),

          actionsOverflowAlignment: OverflowBarAlignment.start,

          content: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: ImagePickerOptionButton(
                  title: 'Camera',
                  onpress: () async {
                    GoRouter.of(context).pop();

                    await cubit.pickProfileImageFromCamera();
                  },
                ),
              ),
              Gap(30),
              Flexible(
                child: ImagePickerOptionButton(
                  title: 'Gallery',
                  onpress: () async {
                    GoRouter.of(context).pop();
                    await cubit.pickProfileImageFromGallery();
                  },
                ),
              ),
            ],
          ),
        ),
  );
}
