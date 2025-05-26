String generateUniqueFileName(String originalPath) {
  final extension = originalPath.split('.').last;
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final randomSuffix = DateTime.now().microsecond;
  return 'video_${timestamp}_$randomSuffix.$extension';
}
