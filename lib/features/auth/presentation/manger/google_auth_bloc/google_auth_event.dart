import 'package:equatable/equatable.dart';

abstract class GoogleAuthEvent extends Equatable {}

class GoogleAuthButtonEvent extends GoogleAuthEvent {
  @override
  List<Object?> get props => [];
}
