import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';

class PickProfileImageStates extends Equatable {
  final String? imageUrl;
  final BlocStatus status;
  final String? errMessage;
  final String? succMessage;

  const PickProfileImageStates({
    this.imageUrl,
    this.status = BlocStatus.initial,
    this.errMessage,
    this.succMessage,
  });
  PickProfileImageStates copyWith({
    String? imageUrl,
    BlocStatus? status,
    String? errMessage,
    String? succMessage,
  }) {
    return PickProfileImageStates(
      imageUrl: imageUrl ?? this.imageUrl,
      errMessage: errMessage ?? this.errMessage,
      succMessage: succMessage ?? this.succMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, errMessage, succMessage];
}
