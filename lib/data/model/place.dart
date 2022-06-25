import 'package:equatable/equatable.dart';

abstract class PlaceModel extends Equatable {
  final String id;
  final String name;
  final String coverImage;

  const PlaceModel({
    required this.id,
    required this.name,
    required this.coverImage,
  });

  @override
  List<Object?> get props => [id, name, coverImage];
}
