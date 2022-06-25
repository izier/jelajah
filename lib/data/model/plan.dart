import 'package:equatable/equatable.dart';

class Plan extends Equatable {
  final String id;
  final String name;
  final bool status;

  const Plan({required this.id, required this.name, required this.status});

  @override
  List<Object?> get props => [
        id,
        name,
        status,
      ];
}
