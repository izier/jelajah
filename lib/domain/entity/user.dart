import 'package:equatable/equatable.dart';
import 'package:jelajah/data/model/plan.dart';

class User extends Equatable {
  final int id;
  final String fullname;
  final String username;
  final String password;
  final int points;
  final List<PlanModel>? plans;

  const User({
    required this.id,
    required this.fullname,
    required this.username,
    required this.password,
    required this.points,
    required this.plans,
  });

  @override
  List<Object?> get props => [
        id,
        fullname,
        username,
        password,
        points,
        plans,
      ];
}
