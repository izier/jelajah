import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/plan.dart';

class PlaceDetailModel extends Equatable {
  final String id;
  final String name;
  final String address;
  final String description;
  final double rating;
  final List<Plan> planList;
  final List<String> image;
  final String coverImage;

  const PlaceDetailModel({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.rating,
    required this.planList,
    required this.image,
    required this.coverImage,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
