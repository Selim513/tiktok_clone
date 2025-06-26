import 'package:equatable/equatable.dart';

abstract class FetchUserEvent extends Equatable{}
class FetchUserInfoEvent extends FetchUserEvent{
  @override
  List<Object?> get props => [];
}