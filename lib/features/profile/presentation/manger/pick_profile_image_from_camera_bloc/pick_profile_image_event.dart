import 'package:equatable/equatable.dart';

abstract class PickProfileImageEvent extends Equatable {}

class PickProfileImageFromCameraEvent extends PickProfileImageEvent {
  final String? imageUrl;

  PickProfileImageFromCameraEvent({this.imageUrl});
  @override
  List<Object?> get props => [imageUrl];
}

class PickProfileImageFromGalleryEvent extends PickProfileImageEvent {
  final String? imageUrl;

  PickProfileImageFromGalleryEvent({ this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}
