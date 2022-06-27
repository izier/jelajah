import 'package:jelajah/data/model/login_model.dart';
import 'package:jelajah/data/repository/user_repository.dart';

class UserUsecase {
  final UserRepository userRepository;

  UserUsecase({required this.userRepository});

  login(LoginModel loginModel) {
    return userRepository.login(loginModel);
  }

  register() {}
}
