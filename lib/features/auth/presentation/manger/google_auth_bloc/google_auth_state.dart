import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';

class GoogleAuthState extends Equatable {
  final BlocStatus status;
  final String? errMessage;
  final String? succMessage;

  const GoogleAuthState({
    this.status = BlocStatus.initial,
    this.errMessage,
    this.succMessage,
  });
  GoogleAuthState copyWith({
    BlocStatus? status,
    String? errMessage,
    String? succMessage,
  }) {
    return GoogleAuthState(
      status: status ?? this.status,
      errMessage: errMessage ?? this.errMessage,
      succMessage: succMessage ?? this.succMessage,
    );
  }

  @override
  List<Object?> get props => [succMessage, status, errMessage];
}
