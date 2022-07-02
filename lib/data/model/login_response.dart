import 'package:equatable/equatable.dart';
import 'package:jelajah/data/model/plan.dart';

class LoginResponse extends Equatable {
  final String status;
  final String message;
  final String fullname;
  final String username;
  final String password;
  final int id;
  final int points;
  final List<PlanModel> plans;

  const LoginResponse({
    required this.status,
    required this.message,
    required this.fullname,
    required this.id,
    required this.password,
    required this.username,
    required this.points,
    required this.plans,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["messsage"],
        fullname: json["user"]["fullname"],
        username: json["user"]["username"],
        password: json["user"]["password"],
        id: json["user"]["id"],
        points: json["user"]["points"],
        plans: json["user"]["plans"] == []
            ? <PlanModel>[]
            : List<PlanModel>.from(
                json["user"]["plans"].map((x) => PlanModel.fromJson(x)),
              ),
      );

  @override
  List<Object?> get props => [
        status,
        message,
        fullname,
        username,
        password,
        id,
        points,
        plans,
      ];
}
