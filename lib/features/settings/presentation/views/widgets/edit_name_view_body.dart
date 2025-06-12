import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';
import 'package:tiktok_clone/core/utils/function_helper.dart';
import 'package:tiktok_clone/core/widgets/custom_elevated_button.dart';

class EditNameViewBody extends StatefulWidget {
  const EditNameViewBody({super.key});

  @override
  State<EditNameViewBody> createState() => _EditNameViewBodyState();
}

class _EditNameViewBodyState extends State<EditNameViewBody> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Name',
                style: AppFontstyle.fontStyle20.copyWith(color: Colors.grey),
              ),
            ],
          ),
          TextField(
            controller: nameController,

            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hint: Text('Your new name', style: TextStyle(color: Colors.grey)),

              border: customOutLineBorders(),
              enabledBorder: customOutLineBorders(),
              focusedBorder: customOutLineBorders(),
            ),
          ),
          Gap(30),
          CustomElevatedButton(
            widget: Text('Save', style: AppFontstyle.fontStyle20),
            onPress: () {
              Supabase.instance.client.auth.updateUser(
                UserAttributes(data: {'Name': nameController.text}),
              );
            },
          ),
        ],
      ),
    );
  }
}
