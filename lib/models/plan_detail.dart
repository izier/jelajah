import 'package:jelajah/models/mission.dart';
import 'package:jelajah/models/place.dart';

class PlanDetail {
  String id;
  String name;
  int category;
  String description;
  List<Mission> missionList;
  List<Place> placeList;
  bool status;

  PlanDetail({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.missionList,
    required this.placeList,
    required this.status,
  });
}