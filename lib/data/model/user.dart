import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/user.dart';

class UserModel extends Equatable {
  final String id;
  final String fullname;
  final String username;
  final String password;
  final int points;
  const UserModel(
      {required this.id,
      required this.fullname,
      required this.username,
      required this.password,
      required this.points});

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        password: json["password"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "password": password,
        "points": points,
      };

  User toEntity() => User(
        id: id,
        fullname: fullname,
        username: username,
        password: password,
        points: points,
      );

  @override
  List<Object?> get props => [
        id,
        fullname,
        username,
        password,
      ];
}
