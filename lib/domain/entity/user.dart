import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String fullname;
  final String username;
  final String password;

  const User({
    required this.id,
    required this.fullname,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        id,
        fullname,
        username,
        password,
      ];
}
