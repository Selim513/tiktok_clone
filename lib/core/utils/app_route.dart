import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/auth/presentation/views/auth_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/login_view.dart';
import 'package:tiktok_clone/features/auth/presentation/views/sign_up_with_email.dart';
import 'package:tiktok_clone/features/auth/presentation/views/sign_up_with_google.dart';
import 'package:tiktok_clone/features/home/presentation/views/home_view.dart';
import 'package:tiktok_clone/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kAuth = '/auth';
  static const kSignUpWithEmail = '/signUpWithEmail';
  static const kSignUpWithGoogle = '/signUpWithGoogle';
  static const kLoginView = '/loginView';
  static const kHome = '/home';

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
      GoRoute(
        path: kLoginView,
        name: kLoginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: kHome,
        name: kHome,
        builder: (context, state) => HomeView(),
      ),
    ],
  );
}
