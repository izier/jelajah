import 'package:jelajah/data/model/mission.dart';

class PlanModel {
  PlanModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.missions,
    required this.status,
  });

  final int id;
  final String name;
  final String category;
  final String description;
  final List<MissionModel> missions;
  final bool status;

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        description: json["description"],
        missions: List<MissionModel>.from(
            json["missions"].map((x) => MissionModel.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "description": description,
        "missions": List<dynamic>.from(missions.map((x) => x.toJson())),
        "status": status,
      };
}
