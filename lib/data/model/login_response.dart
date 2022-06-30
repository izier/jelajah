import 'package:equatable/equatable.dart';
import 'package:jelajah/data/model/user.dart';

class LoginResponse extends Equatable {
  final String status;
  final String message;
  final String fullname;
  final String username;
  final String password;
  final String id;
  final int points;

  const LoginResponse({
    required this.status,
    required this.message,
    required this.fullname,
    required this.id,
    required this.password,
    required this.username,
    required this.points,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["messsage"],
        fullname: json["user"]["fullname"],
        username: json["user"]["username"],
        password: json["user"]["password"],
        id: json["user"]["id"],
        points: json["user"]["points"],
      );

  @override
  List<Object?> get props =>
      [status, message, fullname, username, password, id, points];
}
