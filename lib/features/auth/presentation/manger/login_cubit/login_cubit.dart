import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/enums/bloc_status.dart';
import 'package:tiktok_clone/core/uses_case/auth_uses_case.dart';
import 'package:tiktok_clone/features/auth/domain/use_cases/login_use_case.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_bloc_events.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/login_cubit/login_bloc_state.dart';

// class LoginCubit extends Bloc<LoginBlocEvent, LoginBlocState> {
//   LoginCubit(this.authRepoImpl) : super(const LoginBlocState()){}
//   TextEditingController loginEmailController = TextEditingController();
//   TextEditingController loginPasswordController = TextEditingController();
//   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
//   final AuthRepoImpl authRepoImpl;

// }
class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  final LoginUsesCase loginUsesCase;
  LoginBloc(this.loginUsesCase) : super(const LoginBlocState()) {
    on<LoginBlocEvent>((event, emit) async {
      if (event is LoginSubmitted) {
        try {
          emit(state.copyWith(status: BlocStatus.loading));
          await loginUsesCase.call(
            LoginParams(email: event.email, password: event.password),
          );
          emit(
            state.copyWith(
              status: BlocStatus.success,
              succMessage: 'Welcome Back !.',
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(status: BlocStatus.fail, errMessage: e.toString()),
          );
        }
      }
    });
  }
}
