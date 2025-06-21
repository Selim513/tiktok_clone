import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/enums/bloc_status.dart';
import 'package:tiktok_clone/core/uses_case/auth_uses_case.dart';
import 'package:tiktok_clone/features/auth/domain/use_cases/register_use_case.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_bloc/register_bloc_state.dart';
import 'package:tiktok_clone/features/auth/presentation/manger/register_bloc/register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsesCase registerUsesCase;
  RegisterBloc(this.registerUsesCase) : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterSubmittedEvent) {
        try {
          //-----------------------Loading
          emit(state.copyWith(status: BlocStatus.loading));
          //------------------------Success
          await registerUsesCase.call(
            RegisterParams(
              event.name,
              email: event.email,
              password: event.password,
            ),
          );
          emit(
            state.copyWith(
              succMessage: 'Confrim your email !.',
              status: BlocStatus.success,
            ),
          );
        } on AuthException catch (e) {
          //-------------------Error------
          emit(
            state.copyWith(errMessage: e.toString(), status: BlocStatus.fail),
          );
        } catch (e) {
          state.copyWith(errMessage: e.toString(), status: BlocStatus.fail);
        }
      }
    });
  }
}
