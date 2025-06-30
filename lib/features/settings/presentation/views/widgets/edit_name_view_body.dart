import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/settings/presentation/manger/update_user_data_bloc/update_user_data_bloc.dart';
import 'package:tiktok_clone/features/settings/presentation/manger/update_user_data_bloc/update_user_data_event.dart';
import 'package:tiktok_clone/features/settings/presentation/manger/update_user_data_bloc/update_user_data_state.dart';
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
      child: BlocConsumer<UpdateUserDataBloc, UpdateUserDataState>(
        listener: (context, state) {
          if (state.status == BlocStatus.success) {
            CustomSnackBar.successSnackBar(
              context,
              message: state.succMessage!,
            );
          } else {
            CustomSnackBar.errorSnackBar(context, message: state.errMessage!);
          }
        },
        builder: (context, state) {
          return state.status == BlocStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : AccountEditField(
                buttonTitle: 'Save',
                buttonOnTap: () {
                  print('----------${nameController.text}');
                  context.read<UpdateUserDataBloc>()..add(
                    UpdateNameEvent(name: nameController.text),
                  );
                  // Constant.supabase.auth.updateUser(
                  //   UserAttributes(data: {'Name': nameController.text}),
                  // );
                },
                controller: nameController,
                hintText: 'Your new name',
                title: 'Name',
              );
        },
      ),
    );
  }
}
