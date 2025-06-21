import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/bloc_status.dart';
import 'package:tiktok_clone/core/uses_case/auth_uses_case.dart';
import 'package:tiktok_clone/features/auth/domain/use_cases/login_use_case.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_bloc/login_events.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_bloc/login_bloc_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginBlocState> {
  final LoginUsesCase loginUsesCase;
  LoginBloc(this.loginUsesCase) : super(const LoginBlocState()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginSubmittedEvent) {
        try {
          //----------Loading
          emit(state.copyWith(status: BlocStatus.loading));
          //----------Success
          await loginUsesCase.call(
            LoginParams(email: event.email, password: event.password),
          );
          emit(
            state.copyWith(
              status: BlocStatus.success,
              succMessage: 'Welcome Back !.',
            ),
          );
          //------------------------Fail
        } catch (e) {
          emit(
            state.copyWith(status: BlocStatus.fail, errMessage: e.toString()),
          );
        }
      }
    });
  }
}
