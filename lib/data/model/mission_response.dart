import 'package:equatable/equatable.dart';

class MissionResponse extends Equatable {
  final String status;
  final String message;

  const MissionResponse({
    required this.status,
    required this.message,
  });

  factory MissionResponse.fromJson(Map<String, dynamic> json) =>
      MissionResponse(
        status: json["status"],
        message: json["messsage"],
      );

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
