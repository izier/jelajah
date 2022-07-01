import 'package:equatable/equatable.dart';

class MissionModel extends Equatable {
  const MissionModel({
    required this.id,
    required this.planId,
    required this.name,
    required this.lat,
    required this.long,
    required this.status,
  });

  final int id;
  final int planId;
  final String name;
  final double lat;
  final double long;
  final bool status;

  factory MissionModel.fromJson(Map<String, dynamic> json) => MissionModel(
        id: json["id"],
        planId: json["planId"],
        name: json["name"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "planId": planId,
        "name": name,
        "lat": lat,
        "long": long,
        "status": status,
      };

  @override
  List<Object?> get props => [
        id,
        planId,
        name,
        lat,
        long,
        status,
      ];
}
