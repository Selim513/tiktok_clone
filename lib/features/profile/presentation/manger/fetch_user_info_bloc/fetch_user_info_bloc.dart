import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/features/profile/domain/use_cases/fetch_user_info_use_case/fetch_user_info_use_case.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_bloc_state.dart';
import 'package:tiktok_clone/features/profile/presentation/manger/fetch_user_info_bloc/fetch_user_info_event.dart';

class FetchUserInfoBloc extends Bloc<FetchUserEvent, FetchUserBlocState> {
  final FetchUserInfoUseCase user;
  FetchUserInfoBloc(this.user) : super(const FetchUserBlocState()) {
    on<FetchUserInfoEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: BlocStatus.loading));
        final response = await user.call();
        emit(
          state.copyWith(status: BlocStatus.success, userInfoEntity: response),
        );
      } catch (e) {
        print('eeeeeeeeeeeeeeeeeeeeeee$e');
        emit(state.copyWith(status: BlocStatus.fail));
      }
    });
  }
}
