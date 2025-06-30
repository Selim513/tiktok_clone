import 'package:equatable/equatable.dart';

abstract class UpdateUserDataEvent extends Equatable {}

class UpdateNameEvent extends UpdateUserDataEvent {
  final String name;
  @override

  UpdateNameEvent({required this.name});
  List<Object?> get props => [name];
}
