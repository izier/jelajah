import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/city.dart';

class CityModel extends Equatable {
  final String id;
  final String name;
  final String icon;
  final String description;

  const CityModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
      };

  City toEntity() => City(
        id: id,
        name: name,
        icon: icon,
        description: description,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        description,
      ];
}
