import 'package:jelajah/models/plan.dart';

class Place {
  String name;
  String address;
  String description;
  double rating;
  List<Plan> planList;
  List<String> image;
  String coverImage;

  Place({
    required this.name,
    required this.address,
    required this.description,
    required this.rating,
    required this.planList,
    required this.image,
    required this.coverImage
  });
}