import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GoogleState {}

class GoogleAuthInitial extends GoogleState {}

class GoogleAuthLoading extends GoogleState {}

class GoogleAuthSuccess extends GoogleState {
}

class GoogleAuthFailure extends GoogleState {
  final String error;
  GoogleAuthFailure(this.error);
}

class GoogleAuthCancelled extends GoogleState {}
