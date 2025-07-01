import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GoogleAuthRepo {
  Future<AuthResponse> googleAuth();
}
