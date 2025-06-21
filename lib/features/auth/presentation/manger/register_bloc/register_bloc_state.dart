import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/core/enums/bloc_status.dart';

//----
class RegisterState extends Equatable {
  final BlocStatus status;
  final String? succMessage;
  final String? errMessage;

  const RegisterState({
    this.status = BlocStatus.initial,
    this.succMessage,
    this.errMessage,
  });
  RegisterState copyWith({
    BlocStatus? status,
    String? succMessage,
    String? errMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      succMessage: succMessage ?? this.succMessage,
      errMessage: errMessage ?? this.errMessage,
    );
  }

  @override
  List<Object?> get props => [status, succMessage, errMessage];
}
