import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterSubmittedEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;

  RegisterSubmittedEvent({
    required this.name,
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [name, email, password];
}
