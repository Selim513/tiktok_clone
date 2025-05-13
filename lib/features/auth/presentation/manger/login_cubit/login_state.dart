import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';

class LoginSuccess extends UserAuthState {
  final String succMessage;

  LoginSuccess({required this.succMessage});
}

class LoginLoading extends UserAuthState {}

class LoginFailure extends UserAuthState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}
