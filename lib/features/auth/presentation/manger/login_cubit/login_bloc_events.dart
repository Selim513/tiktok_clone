import 'package:equatable/equatable.dart';

abstract class LoginBlocEvent extends Equatable {

}

class LoginSubmitted extends LoginBlocEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
  @override
  List<Object?> get props => [email,password];
}
