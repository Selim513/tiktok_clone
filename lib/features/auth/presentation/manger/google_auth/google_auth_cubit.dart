// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:tiktok_clone/features/auth/presentation/manger/google_auth/google_state.dart';

// class GoogleAuthCubit extends Cubit<GoogleState> {
//   GoogleAuthCubit() : super(GoogleAuthInitial());

//   Future<void> signInWithGoogle() async {
//     emit(GoogleAuthLoading());
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser == null) {
//         emit(GoogleAuthCancelled());
//         return;
//       }

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final userCredential = await FirebaseAuth.instance.signInWithCredential(
//         credential,
//       );

//       emit(GoogleAuthSuccess(userCredential.user!));
//     } catch (e) {
//       emit(GoogleAuthFailure(e.toString()));
//     }
//   }
// }
