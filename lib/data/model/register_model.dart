import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String fullname;
  final String username;
  final String password;

  const RegisterModel({
    required this.fullname,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "username": username,
        "password": password,
      };

  @override
  List<Object?> get props => [
        fullname,
        username,
        password,
      ];
}
