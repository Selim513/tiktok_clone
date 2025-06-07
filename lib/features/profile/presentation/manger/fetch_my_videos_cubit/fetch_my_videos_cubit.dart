import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/fetch_my_videos_use_case.dart/fetch_my_videos_use_case.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_my_videos_cubit/fetch_my_videos_state.dart';

class FetchMyVideosCubit extends Cubit<FetchMyVideosState> {
  FetchMyVideosCubit(this.fetchMyVideosUseCase) : super(FetchMyVideosInitial());
  final FetchMyVideosUseCase fetchMyVideosUseCase;

  fetchMyVideos() async {
    try {
      emit(FetchMyVideosLoading());
      var videoUrl = await fetchMyVideosUseCase.call();
      emit(FetchMyVideosSuccess(videosUrl: videoUrl));
    } catch (e) {
      emit(FetchMyVideosFailure());
      print('Cubit----FetchMy Videos Error--------${e.toString()}');
    }
  }
}
