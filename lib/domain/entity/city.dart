import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/place.dart';
import 'package:jelajah/domain/entity/plan.dart';

class City extends Equatable {
  final int id;
  final String name;
  final String icon;
  final String description;
  final String coverImage;
  final List<Plan> plans;
  final List<Place> places;

  const City({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.coverImage,
    required this.plans,
    required this.places,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        description,
        coverImage,
        plans,
        places,
      ];
}
