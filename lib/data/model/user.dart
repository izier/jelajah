import 'package:equatable/equatable.dart';
import 'package:jelajah/data/model/plan.dart';
import 'package:jelajah/domain/entity/user.dart';

class UserModel extends Equatable {
  final int id;
  final String fullname;
  final String username;
  final String password;
  final int points;
  final List<PlanModel>? plans;

  const UserModel(
      {required this.id,
      required this.fullname,
      required this.username,
      required this.password,
      required this.points,
      required this.plans});

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        password: json["password"],
        points: json["points"],
        plans: List<PlanModel>.from(
            json["plans"].map((x) => PlanModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "password": password,
        "points": points,
        "plans": plans,
      };

  User toEntity() => User(
        id: id,
        fullname: fullname,
        username: username,
        password: password,
        points: points,
        plans: plans,
      );

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
