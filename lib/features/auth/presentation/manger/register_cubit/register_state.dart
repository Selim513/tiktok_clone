abstract class AuthState {}

class AuthInital extends AuthState {}

class RegisterFailure extends AuthState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

class RegisterSuccess extends AuthState {
  final String succMessage;

  RegisterSuccess({required this.succMessage});
}

class RegisterLoading extends AuthState {}
