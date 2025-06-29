import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class PostVideoEvent extends Equatable {}

class PostVideoFromCameraEvent extends PostVideoEvent {
  final File video;
  @override
  PostVideoFromCameraEvent({required this.video});
  @override
  List<Object?> get props => [];
}

class PostVideoFromGalleryEvent extends PostVideoEvent {
  PostVideoFromGalleryEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
