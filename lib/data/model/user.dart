import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/user.dart';

class UserModel extends Equatable {
  final String fullname;
  final String username;
  final String password;

  const UserModel({
    required this.fullname,
    required this.username,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullname: json["fullname"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "username": username,
        "password": password,
      };

  User toEntity() => User(
        fullname: fullname,
        username: username,
        password: password,
      );

  @override
  List<Object?> get props => [
        fullname,
        username,
        password,
      ];
}
