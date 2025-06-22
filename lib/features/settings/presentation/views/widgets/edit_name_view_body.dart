import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/account_edit_field.dart';

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
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 15),
      child: AccountEditField(
        buttonTitle: 'Save',
        buttonOnTap: () {
          Supabase.instance.client.auth.updateUser(
            UserAttributes(data: {'Name': nameController.text}),
          );
        },
        controller: nameController,
        hintText: 'Your new name',
        title: 'Name',
      ),
    );
  }
}
