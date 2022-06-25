import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/plan.dart';

class User extends Equatable {
  final String fullname;
  final String username;
  final String password;

  const User({
    required this.fullname,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        fullname,
        username,
        password,
      ];
}
