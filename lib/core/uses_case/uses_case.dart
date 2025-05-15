abstract class AuthUseCases<Type, Param> {
  Future<Type> call(Param params);
}

class NoParam {}

class LoginParams {
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});
}

class RegisterParams {
  final String email;
  final String password;
  final String name;
  RegisterParams(this.name, {required this.email, required this.password});
}
