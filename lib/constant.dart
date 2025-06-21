import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';

abstract class Constant {
  static String? imagePaht;
  static String videoPreviewUrl = 'videoUrl';
  static String isPreview = 'isPreview';
  static SupabaseClient supabase = getIt.get<SupabaseClient>();
}
