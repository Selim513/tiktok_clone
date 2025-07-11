// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:tiktok_clone/core/utils/app_route.dart';
// import 'package:tiktok_clone/core/widgets/custom_snack_bar.dart';
// import 'package:tiktok_clone/features/auth/presentation/manger/google_auth/google_auth_cubit.dart';
// import 'package:tiktok_clone/features/auth/presentation/manger/google_auth/google_state.dart';
// import 'package:tiktok_clone/features/auth/presentation/views/widgets/custom_auth_selection_button.dart';

// class SignUpWithGoogleButton extends StatelessWidget {
//   const SignUpWithGoogleButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<GoogleAuthCubit, GoogleAuthState>(
//       listener: (context, state) {
//         if (state is GoogleAuthSuccess) {
//           GoRouter.of(context).goNamed(AppRouter.kMainTab);
//         } else if (state is GoogleAuthFailure) {
//           print('==================${state.error}');
//           CustomSnackBar.errorSnackBar(context, message: state.error);
//         } else if (state is GoogleAuthCancelled) {
//           GoRouter.of(context).pop();
//         } else {
//           const Center(child: CircularProgressIndicator());
//         }
//       },
//       child: CustomAutthSelectionButton(
//         onPress: () {
//           context.read<GoogleAuthCubit>().signInWithGoogle();
//         },
//         icon: FontAwesomeIcons.google,
//         title: 'Continue with Google',
//       ),
//     );
//   }
// }
