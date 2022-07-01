import 'package:jelajah/data/model/plan.dart';

class PlaceModel {
  PlaceModel({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.rating,
    required this.plans,
    required this.image,
    required this.coverImage,
  });

  final int id;
  final String name;
  final String address;
  final String description;
  final double rating;
  final List<PlanModel> plans;
  final List<String> image;
  final String coverImage;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        description: json["description"],
        rating: json["rating"].toDouble(),
        plans: List<PlanModel>.from(
            json["plans"].map((x) => PlanModel.fromJson(x))),
        image: List<String>.from(json["image"].map((x) => x)),
        coverImage: json["coverImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "description": description,
        "rating": rating,
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
        "image": List<dynamic>.from(image.map((x) => x)),
        "coverImage": coverImage,
      };
}
