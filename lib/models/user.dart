import 'package:jelajah/models/plan.dart';

class User {
  String fullname;
  String username;
  String password;
  int exp = 0;
  List<Plan> planList = [];

  User({
    required this.fullname,
    required this.username,
    required this.password
  });
}