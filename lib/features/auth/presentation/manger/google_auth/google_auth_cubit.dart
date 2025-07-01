// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:tiktok_clone/features/auth/presentation/manger/google_auth/google_state.dart';


// class GoogleAuthCubit extends Cubit<GoogleAuthState> {
//   GoogleAuthCubit() : super(GoogleAuthInitial());

//   // create GoogleSignIn instance
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

//   Future<void> signInWithGoogle() async {
//     try {
//       emit(GoogleAuthLoading());

//       // تسجيل الدخول بـ Google
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser == null) {
//         // المستخدم ألغى العملية
//         emit(GoogleAuthFailure('تم إلغاء تسجيل الدخول'));
//         return;
//       }

//       // الحصول على authentication details
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final String? accessToken = googleAuth.accessToken;
//       final String? idToken = googleAuth.idToken;

//       if (accessToken == null || idToken == null) {
//         emit(GoogleAuthFailure('فشل في الحصول على tokens'));
//         return;
//       }

//       // تسجيل الدخول في Supabase
//       final AuthResponse response = await Supabase.instance.client.auth
//           .signInWithIdToken(
//             provider: OAuthProvider.google,
//             idToken: idToken,
//             accessToken: accessToken,
//           );

//       if (response.user != null) {
//         emit(GoogleAuthSuccess());
//       } else {
//         emit(GoogleAuthFailure('فشل في تسجيل الدخول'));
//       }
//     } catch (e) {
//       emit(GoogleAuthFailure('خطأ: ${e.toString()}'));
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       emit(GoogleAuthLoading());

//       // تسجيل الخروج من Google و Supabase
//       await Future.wait([
//         _googleSignIn.signOut(),
//         Supabase.instance.client.auth.signOut(),
//       ]);

//       emit(GoogleAuthInitial());
//     } catch (e) {
//       emit(GoogleAuthFailure('فشل في تسجيل الخروج: ${e.toString()}'));
//     }
//   }

//   // للتحقق من حالة المستخدم الحالية
//   void checkCurrentUser() {
//     final user = Supabase.instance.client.auth.currentUser;
//     if (user != null) {
//       emit(GoogleAuthSuccess());
//     } else {
//       emit(GoogleAuthInitial());
//     }
//   }
// }
