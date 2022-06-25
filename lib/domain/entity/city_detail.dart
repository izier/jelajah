import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/place.dart';
import 'package:jelajah/domain/entity/plan.dart';

class CityDetail extends Equatable {
  String id;
  String name;
  String icon;
  String description;
  String coverImage;
  List<Plan> planList;
  List<Place> placeList;

  CityDetail({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.coverImage,
    required this.planList,
    required this.placeList,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        description,
        coverImage,
        planList,
        placeList,
      ];
}
