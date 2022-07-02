part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserHasData extends UserState {
  final User user;

  const UserHasData(this.user);

  @override
  List<Object> get props => [user];
}

class UserFailed extends UserState {
  final String message;

  const UserFailed(this.message);

  @override
  List<Object> get props => [message];
}

class AddLoading extends UserState {}

class AddSuccess extends UserState {
  final PlanModel plan;

  const AddSuccess(this.plan);

  @override
  List<Object> get props => [plan];
}

class AddFailed extends UserState {
  final String message;

  const AddFailed(this.message);

  @override
  List<Object> get props => [message];
}

class UpdateLoading extends UserState {}

class UpdateMissionSuccess extends UserState {
  final String message;

  const UpdateMissionSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class UpdateMissionFailed extends UserState {
  final String message;

  const UpdateMissionFailed(this.message);

  @override
  List<Object> get props => [message];
}

class UploadLoading extends UserState {}

class UploadPhotoSuccess extends UserState {
  final String message;

  const UploadPhotoSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class UploadPhotoFailed extends UserState {
  final String message;

  const UploadPhotoFailed(this.message);

  @override
  List<Object> get props => [message];
}
