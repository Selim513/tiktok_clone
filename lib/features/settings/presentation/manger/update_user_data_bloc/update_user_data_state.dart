import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';

class UpdateUserDataState extends Equatable {
  final BlocStatus status;
  final String? succMessage;
  final String? errMessage;

  const UpdateUserDataState({
    this.status = BlocStatus.initial,
    this.succMessage,
    this.errMessage,
  });
  UpdateUserDataState copyWith({
    BlocStatus? status,
    String? succMessage,
    String? errMessage,
  }) {
    return UpdateUserDataState(
      status: status ?? this.status,
      succMessage: succMessage ?? this.succMessage,
      errMessage: errMessage ?? this.errMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, succMessage, errMessage];
}
