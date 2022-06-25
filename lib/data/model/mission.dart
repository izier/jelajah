import 'package:equatable/equatable.dart';

class Mission extends Equatable {
  final String id;
  final String name;
  final String planId;
  final String planName;

  const Mission({
    required this.id,
    required this.name,
    required this.planId,
    required this.planName,
  });

  @override
  List<Object?> get props => [id, name, planId, planName];
}
