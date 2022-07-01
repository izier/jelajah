import 'dart:convert';

import 'package:jelajah/data/model/place.dart';
import 'package:jelajah/data/model/plan.dart';

List<CityModel> cityModelFromJson(String str) =>
    List<CityModel>.from(json.decode(str).map((x) => CityModel.fromJson(x)));

class CityModel {
  CityModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.coverImage,
    required this.plans,
    required this.places,
  });

  final int id;
  final String name;
  final String icon;
  final String description;
  final String coverImage;
  final List<PlanModel> plans;
  final List<PlaceModel> places;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        description: json["description"],
        coverImage: json["coverImage"],
        plans: List<PlanModel>.from(
            json["plans"].map((x) => PlanModel.fromJson(x))),
        places: List<PlaceModel>.from(
            json["places"].map((x) => PlaceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "description": description,
        "coverImage": coverImage,
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
      };
}
