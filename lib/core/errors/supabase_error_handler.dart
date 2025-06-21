import 'package:supabase_flutter/supabase_flutter.dart';

String mapSupabaseAuthError(String? errorMessage) {
  if (errorMessage == null) {
    return 'Something went wrong. Please try again.';
  }

  // Map specific Supabase error codes and messages to friendly messages
  if (errorMessage.contains('User already registered')) {
    return 'This email is already registered.';
  } else if (errorMessage.contains('Invalid login credentials')) {
    return 'Incorrect email or password.';
  } else if (errorMessage.contains('Email not confirmed')) {
    return 'Please confirm your email address.';
  } else if (errorMessage.contains('Password should be at least')) {
    return 'Password is too weak.';
  } else if (errorMessage.contains('email_address_invalid') ||
      errorMessage.contains('invalid format')) {
    return 'Please enter a valid email address.';
  } else if (errorMessage.contains('Invalid email')) {
    return 'Enter a valid email address.';
  } else {
    // Fallback for unhandled errors
    return 'Authentication failed: $errorMessage';
  }
}

String extractErrorMessage(dynamic e) {
  if (e is AuthException) {
    return mapSupabaseAuthError(e.message);
  } else {
    return mapSupabaseAuthError(e.toString());
  }
}
