import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final name = user?.userMetadata?['Name'];
    final useProfile = user?.userMetadata?['picture'] as String?;
    print(useProfile);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(name ?? 'user', style: AppFontstyle.fontStyle20)],
        ),
        Gap(50),
        GestureDetector(
          onTap: () async {
            await uploadFromCamera();
          },
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 80,
            backgroundImage:
                (useProfile != null)
                    ? NetworkImage(useProfile)
                    : AssetImage('assets/images/profile.png'),
          ),
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

  uploadFromCamera() async {
    await ImagePicker().pickImage(source: ImageSource.camera).then((
      value,
    ) async {
      imagePath = value!.path;

      var user = Supabase.instance.client.auth;

      var file = File(value.path);
      await Supabase.instance.client.storage
          .from('profile-image')
          .upload(
            '${user.currentUser?.id}',
            fileOptions: const FileOptions(upsert: true),
            file,
          )
          .then((value) {
            final publicUrl = Supabase.instance.client.storage
                .from('profile-image')
                .getPublicUrl('${user.currentUser?.id}');
            user.updateUser(UserAttributes(data: {'picture': publicUrl}));
          });
    });
    setState(() {});
  }
}
