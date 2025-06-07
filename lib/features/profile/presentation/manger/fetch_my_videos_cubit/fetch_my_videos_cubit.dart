import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/fetch_my_videos_use_case.dart/fetch_my_videos_use_case.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_my_videos_cubit/fetch_my_videos_state.dart';

class FetchMyVideosCubit extends Cubit<FetchMyVideosState> {
  FetchMyVideosCubit(this.fetchMyVideosUseCase) : super(FetchMyVideosInitial());
  final FetchMyVideosUseCase fetchMyVideosUseCase;

  fetchMyVideos() async {
    try {
      emit(FetchMyVideosLoading());
      var videoUrl = await fetchMyVideosUseCase.call().timeout(
        Duration(seconds: 15),
        onTimeout: () => throw TimeoutException('Timeout'),
      );
      emit(FetchMyVideosSuccess(videosUrl: videoUrl));
    } on TimeoutException {
      emit(
        FetchMyVideosFailure(
          errMessage: 'Please check your internet and try again !.',
        ),
      );
    } catch (e) {
      emit(FetchMyVideosFailure(errMessage: e.toString()));
      print('Cubit----FetchMy Videos Error--------${e.toString()}');
    }
  }
}
