import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/mission.dart';
import 'package:jelajah/domain/entity/place.dart';

class PlanDetail extends Equatable {
  final String id;
  final String name;
  final int category;
  final String description;
  final List<Mission> missionList;
  final List<Place> placeList;
  final bool status;

  const PlanDetail({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.missionList,
    required this.placeList,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        missionList,
        status,
      ];
}
