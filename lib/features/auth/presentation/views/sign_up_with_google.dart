import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth_bloc/google_auth_bloc.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth_bloc/google_auth_event.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth_bloc/google_auth_state.dart';
import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_auth_selection_button.dart';

class GoogleAuthCubitViewBody extends StatelessWidget {
  const GoogleAuthCubitViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleAuthBloc, GoogleAuthState>(
      listener: (context, state) {
        if (state.status == BlocStatus.success ||
            Constant.supabase.accessToken != null) {
          GoRouter.of(context).goNamed(AppRouter.kMainTab);
        } else if (state.status == BlocStatus.fail) {
          CustomSnackBar.errorSnackBar(context, message: state.errMessage!);
        } else {
          const Center(child: CircularProgressIndicator());
        }
      },
      child: CustomAutthSelectionButton(
        onPress: () async {
          context.read<GoogleAuthBloc>().add(GoogleAuthButtonEvent());
        },
        icon: FontAwesomeIcons.google,
        title: 'Continue with Google',
      ),
    );
  }
}
