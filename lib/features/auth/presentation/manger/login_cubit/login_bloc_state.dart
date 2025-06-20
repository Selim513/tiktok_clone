import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/core/enums/bloc_status.dart';

class LoginBlocState extends Equatable {
  final BlocStatus status;
  final String? errMessage;
  final String? succMessage;

  const LoginBlocState({
    this.status = BlocStatus.initial,
    this.errMessage,
    this.succMessage,
  });
  LoginBlocState copyWith({
    BlocStatus? status,
    String? errMessage,
    String? succMessage,
  }) {
    return LoginBlocState(
      status: status ?? this.status,
      errMessage: errMessage ?? this.errMessage,
      succMessage: succMessage ?? this.succMessage,
    );
  }

  @override
  List<Object?> get props => [succMessage, status, errMessage];
}
