import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/features/settings/domain/use_case/update_user_data_use_case.dart';
import 'package:tiktok_clone/features/settings/presentation/manger/update_user_data_bloc/update_user_data_event.dart';
import 'package:tiktok_clone/features/settings/presentation/manger/update_user_data_bloc/update_user_data_state.dart';

class UpdateUserDataBloc
    extends Bloc<UpdateUserDataEvent, UpdateUserDataState> {
  final UpdateUserDataUseCase user;
  UpdateUserDataBloc(this.user) : super(const UpdateUserDataState()) {
    on<UpdateNameEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: BlocStatus.loading));
        //-
        await user.call(event.name);
        emit(
          state.copyWith(
            status: BlocStatus.success,
            succMessage: 'Name has been updated !.',
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: BlocStatus.fail,
            errMessage: 'There is some thing wrong $e',
          ),
        );
      }
    });
  }
}
