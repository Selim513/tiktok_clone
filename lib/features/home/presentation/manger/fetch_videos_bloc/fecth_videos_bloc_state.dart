part of 'fecth_videos_bloc_bloc.dart';

class FecthVideosBlocState extends Equatable {
  final String? errMessage;
  final BlocStatus status;
  final List<String>? videos;

  const FecthVideosBlocState({
    this.videos,
    this.status = BlocStatus.initial,
    this.errMessage,
  });

  FecthVideosBlocState copyWith({
    BlocStatus? status,
    List<String>? videos,
    String? errMessage,
  }) {
    return FecthVideosBlocState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
      errMessage: errMessage ?? this.errMessage,
    );
  }

  @override
  List<Object> get props => [status, videos ?? '', errMessage ?? 'Error'];
}
