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

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(name, style: AppFontstyle.fontStyle20)],
        ),
        Gap(50),
        GestureDetector(
          onTap: () {
            uploadFromCamera();
          },
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 80,
            backgroundImage:
                (imagePath != null)
                    ? FileImage(File(imagePath!)) as ImageProvider
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
    final imagePicker = await ImagePicker()
        .pickImage(source: ImageSource.camera)
        .then((value) {
          imagePath = value!.path;
          setState(() {});
        });
  }
}
