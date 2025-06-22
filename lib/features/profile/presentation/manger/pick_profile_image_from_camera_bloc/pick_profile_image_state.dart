import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/core/enums/bloc_status.dart';

// abstract class PickProfileImageState {}

// class PickProfileImageInitial extends PickProfileImageState {}

// class PickProfileImageSuccess extends PickProfileImageState {
//   final String succMessage;
//   final String? imageUrl;

//   PickProfileImageSuccess({required this.imageUrl, required this.succMessage});
// }

// class PickProfileImageFailure extends PickProfileImageState {
//   final String errMessage;

//   PickProfileImageFailure({required this.errMessage});
// }

// class PickProfileImageLoading extends PickProfileImageState {}

// class PickProfileImageCancle extends PickProfileImageState {}

///----------
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
