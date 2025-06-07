abstract class FetchMyVideosState {}

class FetchMyVideosInitial extends FetchMyVideosState {}

class FetchMyVideosSuccess extends FetchMyVideosState {
  final List<String> videosUrl;

  FetchMyVideosSuccess({required this.videosUrl});
}

class FetchMyVideosFailure extends FetchMyVideosState {}

class FetchMyVideosLoading extends FetchMyVideosState {}
