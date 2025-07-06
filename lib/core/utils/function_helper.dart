import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/widgets/image_picker_option_button.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_bloc/pick_image_profile_bloc.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/pick_profile_image_from_camera_bloc/pick_profile_image_event.dart';

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
  PickProfileImageBloc cubit,
) {
  return showDialog(
    context: context,

    builder:
        (context) => AlertDialog(
          title: const Center(child: Text('Select ')),

          actionsOverflowAlignment: OverflowBarAlignment.start,

          content: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: ImagePickerOptionButton(
                  title: 'Camera',
                  onpress: () async {
                    GoRouter.of(context).pop();

                    cubit.add(PickProfileImageFromCameraEvent());
                  },
                ),
              ),
              const Gap(30),
              Flexible(
                child: ImagePickerOptionButton(
                  title: 'Gallery',
                  onpress: () async {
                    GoRouter.of(context).pop();
                    cubit.add(PickProfileImageFromGalleryEvent());
                  },
                ),
              ),
            ],
          ),
        ),
  );
}

Future<dynamic> customShowDialogResetPasswordRequest(BuildContext context) {
  return showDialog(
    context: context,

    builder:
        (context) => AlertDialog(
          title: const Center(
            child: Text('Are you sure you want to change your password?'),
          ),

          actionsOverflowAlignment: OverflowBarAlignment.start,

          content: Row(
            children: [
              Flexible(
                child: ImagePickerOptionButton(
                  title: 'Reset now',
                  onpress: () async {
                    var user = Supabase.instance.client.auth;
                    await user.resetPasswordForEmail(
                      user.currentUser!.email!,
                      redirectTo: "com.example.vibement://reset-password",
                    );
                    GoRouter.of(context).pop();
                  },
                ),
              ),
              const Gap(30),
              Flexible(
                child: ImagePickerOptionButton(
                  title: 'Cancle',
                  onpress: () async {
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
  );
}
