import 'package:jelajah/models/place.dart';
import 'package:jelajah/models/plan.dart';

class City {
  String id;
  String name;
  String icon;
  String description;
  String coverImage;
  List<Plan> planList;
  List<Place> placeList;

  City({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.coverImage,
    required this.planList,
    required this.placeList
  });
}
