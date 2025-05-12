import 'package:tiktok_clone/features/auth/presentation/manger/register_cubit/register_state.dart';

class LoginSuccess extends AuthState {
  final String succMessage;

  LoginSuccess({required this.succMessage});
}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}
