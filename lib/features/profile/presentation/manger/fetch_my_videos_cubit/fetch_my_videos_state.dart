abstract class FetchMyVideosState {}

class FetchMyVideosInitial extends FetchMyVideosState {}

class FetchMyVideosSuccess extends FetchMyVideosState {
  final List<String> videosUrl;

  FetchMyVideosSuccess({required this.videosUrl});
}

class FetchMyVideosFailure extends FetchMyVideosState {
  final String errMessage;

  FetchMyVideosFailure({required this.errMessage});
}

class FetchMyVideosLoading extends FetchMyVideosState {}
