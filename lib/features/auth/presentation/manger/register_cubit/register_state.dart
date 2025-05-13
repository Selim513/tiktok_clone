abstract class UserAuthState {}

class AuthInital extends UserAuthState {}

class RegisterFailure extends UserAuthState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

class RegisterSuccess extends UserAuthState {
  final String succMessage;

  RegisterSuccess({required this.succMessage});
}

class RegisterLoading extends UserAuthState {}
