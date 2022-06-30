import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/register.dart';

class RegisterModel extends Equatable {
  final String fullname;
  final String username;
  final String password;

  const RegisterModel({
    required this.fullname,
    required this.username,
    required this.password,
  });

  factory RegisterModel.fromEntity(Register register) => RegisterModel(
        fullname: register.fullname,
        username: register.username,
        password: register.password,
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "username": username,
        "password": password,
      };

  Register toEntity() => Register(
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
