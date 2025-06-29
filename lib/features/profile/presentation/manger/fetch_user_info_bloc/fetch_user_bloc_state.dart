import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/core/enums/general_bloc_status.dart';
import 'package:tiktok_clone/features/profile/domain/entities/user_info_entity.dart';

class FetchUserBlocState extends Equatable {
  final BlocStatus status;
  final UserInfoEntity? userInfoEntity;
  const FetchUserBlocState({
    this.userInfoEntity,
    this.status = BlocStatus.initial,
  });
  FetchUserBlocState copyWith({
    BlocStatus? status,

    UserInfoEntity? userInfoEntity,
  }) {
    return FetchUserBlocState(
      userInfoEntity: userInfoEntity ?? this.userInfoEntity,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, userInfoEntity];
}
