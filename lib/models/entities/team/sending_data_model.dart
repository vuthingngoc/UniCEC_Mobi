import '../../enums/team_status.dart';

class SendingDataModel {
  final int competitionId;
  final int teamId;
  final String teamName;
  final String teamDescription;
  final TeamStatus status;
  SendingDataModel(
      {required this.competitionId,
      required this.teamId,
      required this.teamName,
      required this.teamDescription,
      required this.status});
}
