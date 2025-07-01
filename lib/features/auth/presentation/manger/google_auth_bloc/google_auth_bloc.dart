import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/features/auth/domain/use_cases/google_auth_use_case.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth_bloc/google_auth_event.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/google_auth_bloc/google_auth_state.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  final GoogleAuthUseCase user;
  GoogleAuthBloc(this.user) : super(const GoogleAuthState()) {
    on<GoogleAuthButtonEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: BlocStatus.loading));
        await user.call();

        emit(
          state.copyWith(status: BlocStatus.success, succMessage: 'Success'),
        );
      } catch (e) {
        emit(state.copyWith(status: BlocStatus.fail, errMessage: e.toString()));
      }
    });
  }
}
