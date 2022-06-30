import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String fullname;
  final String username;
  final String password;
  final int points;

  const User({
    required this.id,
    required this.fullname,
    required this.username,
    required this.password,
    required this.points,
  });

  @override
  List<Object?> get props => [
        id,
        fullname,
        username,
        password,
      ];
}
