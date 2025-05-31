import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/home/domain/use_cases/fetch_videos_use_case.dart';
import 'package:tiktok_clone/features/home/presentation/manger/fetch_videos_cubit/fetch_videos_state.dart';

class FetchVideosCubit extends Cubit<FetchVideosState> {
  FetchVideosCubit(this.fetchVideosUsesCase) : super(FetchVideosInital());
  final FetchVideosUsesCase fetchVideosUsesCase;
  fetchVideos() async {
    try {
      emit(FetchVideosLoading());
      final videos = await fetchVideosUsesCase.call();
      emit(FetchVideosSuccess(videos: videos));
    } on Exception catch (e) {
      emit(FetchVideosFailure(errMessage: 'There is an error ${e.toString()}'));
    }
  }
}
