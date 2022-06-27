import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/user.dart';

class UserModel extends Equatable {
  final String id;
  final String fullname;
  final String username;
  final String password;

  const UserModel({
    required this.id,
    required this.fullname,
    required this.username,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "password": password,
      };

  User toEntity() => User(
        id: id,
        fullname: fullname,
        username: username,
        password: password,
      );

  @override
  List<Object?> get props => [
        id,
        fullname,
        username,
        password,
      ];
}
