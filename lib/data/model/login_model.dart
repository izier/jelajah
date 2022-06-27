import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
