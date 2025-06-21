import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/settings/presentation/views/widgets/edit_name_view_body.dart';

class NameEditView extends StatelessWidget {
  const NameEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Name')),
      body: const EditNameViewBody(),
    );
  }
}
