import 'package:jelajah/data/repository/user_repository.dart';
import 'package:jelajah/domain/entity/login.dart';

class UserUsecase {
  final UserRepository userRepository;

  UserUsecase({required this.userRepository});

  login(Login login) {
    return userRepository.login(login);
  }

  register() {}
}
