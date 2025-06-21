import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmittedEvent({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
