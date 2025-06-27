import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/bloc_status.dart';
import 'package:tiktok_clone/features/home/domain/use_cases/fetch_videos_use_case.dart';

part 'fecth_videos_bloc_event.dart';
part 'fecth_videos_bloc_state.dart';

class FecthVideosBlocBloc
    extends Bloc<FecthVideosBlocEvent, FecthVideosBlocState> {
  final FetchVideosUsesCase fetchVideos;

  FecthVideosBlocBloc(this.fetchVideos) : super(const FecthVideosBlocState()) {
    on<FecthVideosBlocEvent>((event, emit) async {
      if (event is FetchVideosEvent) {
        try {
          emit(state.copyWith(status: BlocStatus.loading));
          var videos = await fetchVideos.call().timeout(
            const Duration(seconds: 15),
            onTimeout: () => throw TimeoutException('Timeout'),
          );
          emit(state.copyWith(status: BlocStatus.success, videos: videos));
        } on TimeoutException {
          emit(
            state.copyWith(
              status: BlocStatus.fail,
              errMessage: 'Please check your Internet and try again',
            ),
          );
        } on Exception catch (e) {
          emit(
            state.copyWith(status: BlocStatus.fail, errMessage: e.toString()),
          );
        }
      }
    });
  }
}
