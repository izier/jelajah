import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/login.dart';

class LoginModel extends Equatable {
  final String username;
  final String password;

  const LoginModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };

  factory LoginModel.fromEntity(Login login) => LoginModel(
        username: login.username,
        password: login.password,
      );

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
