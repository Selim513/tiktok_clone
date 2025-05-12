import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleState {}

class GoogleAuthInitial extends GoogleState {}

class GoogleAuthLoading extends GoogleState {}

class GoogleAuthSuccess extends GoogleState {
  final User user;
  GoogleAuthSuccess(this.user);
}

class GoogleAuthFailure extends GoogleState {
  final String error;
  GoogleAuthFailure(this.error);
}

class GoogleAuthCancelled extends GoogleState {}
