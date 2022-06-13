import 'package:jelajah/models/plan.dart';

class PlaceDetail {
  String id;
  String name;
  String address;
  String description;
  double rating;
  List<Plan> planList;
  List<String> image;
  String coverImage;

  PlaceDetail({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.rating,
    required this.planList,
    required this.image,
    required this.coverImage
  });
}