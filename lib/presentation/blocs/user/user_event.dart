part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {
  final int id;

  const GetUserEvent(this.id);

  @override
  List<Object> get props => [id];
}

class AddPlanEvent extends UserEvent {
  final PlanModel plan;

  const AddPlanEvent(this.plan);

  @override
  List<Object> get props => [plan];
}

class UpdateMissionEvent extends UserEvent {
  final MissionModel mission;

  const UpdateMissionEvent(this.mission);

  @override
  List<Object> get props => [mission];
}

class UploadImageEvent extends UserEvent {
  final String path;
  final int userId;
  final int missionId;

  const UploadImageEvent(this.path, this.userId, this.missionId);

  @override
  List<Object> get props => [
        path,
        userId,
        missionId,
      ];
}
