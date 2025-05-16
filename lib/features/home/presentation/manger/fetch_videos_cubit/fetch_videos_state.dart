abstract class FetchVideosState {}

class FetchVideosInital extends FetchVideosState {}

class FetchVideosSuccess extends FetchVideosState {
  final List<String> videos;

  FetchVideosSuccess({required this.videos});
}

class FetchVideosFailure extends FetchVideosState {
  final String errMessage;

  FetchVideosFailure({required this.errMessage});
}

class FetchVideosLoading extends FetchVideosState {}
