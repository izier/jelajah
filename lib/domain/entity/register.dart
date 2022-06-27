import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String fullname;
  final String username;
  final String password;

  const Register({
    required this.fullname,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [fullname, username, password];
}
