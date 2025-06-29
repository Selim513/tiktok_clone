import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';

class PostVideoBlocState extends Equatable {
  final BlocStatus status;
  final String? loadingMessage;
  final String? succMessage;
  final String? errMessage;

  const PostVideoBlocState( {
    this.loadingMessage,
    this.status = BlocStatus.initial,
    this.succMessage,
    this.errMessage,
  });
  PostVideoBlocState copyWith({
    String? loadingMessage,
    BlocStatus? status,
    String? succMessage,
    String? errMessage,
  }) {
    return PostVideoBlocState(
      status: status ?? this.status,
      succMessage: succMessage ?? this.succMessage,
      loadingMessage: loadingMessage??this.loadingMessage,
      errMessage: errMessage ?? this.errMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, errMessage, succMessage,loadingMessage];
}
