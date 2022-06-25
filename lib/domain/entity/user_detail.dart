import 'package:equatable/equatable.dart';
import 'package:jelajah/domain/entity/plan.dart';

class UserDetail extends Equatable {
  final String fullname;
  final String username;
  final String password;
  final int exp;
  final List<Plan> planList;

  const UserDetail({
    required this.fullname,
    required this.username,
    required this.password,
    required this.exp,
    required this.planList,
  });

  @override
  List<Object?> get props => [
        fullname,
        username,
        password,
        exp,
        planList,
      ];
}
