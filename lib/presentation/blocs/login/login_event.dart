part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final Login user;

  const LoginUserEvent(this.user);

  @override
  List<Object> get props => [user];
}
