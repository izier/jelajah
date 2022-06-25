import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final String id;
  final String name;
  final String coverImage;

  const Place({
    required this.id,
    required this.name,
    required this.coverImage,
  });

  @override
  List<Object?> get props => [id, name, coverImage];
}
