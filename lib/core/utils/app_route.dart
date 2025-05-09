import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/auth/presentation/views/auth_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/email_auth_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/google_auth_view.dart';
import 'package:tiktok_clone/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kAuth = '/auth';
  static const kSignUpWithEmail = '/signUpWithEmail';
  static const kSignUpWithGoogle = '/signUpWithGoogle';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        name: kAuth,
        path: kAuth,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        name: kSignUpWithEmail,
        path: kSignUpWithEmail,
        builder: (context, state) => EmailAuthView(),
      ),
      GoRoute(
        name: kSignUpWithGoogle,
        path: kSignUpWithGoogle,
        builder: (context, state) => GoogleAuthView(),
      ),
    ],
  );
}
