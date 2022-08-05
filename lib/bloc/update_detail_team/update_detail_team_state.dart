import 'package:equatable/equatable.dart';
import '../../models/enums/team_status.dart';

class ViewDetailTeamState extends Equatable {
  int competitionId;
  int teamId;
  String valueTeamName;
  String valueTeamDescription;
  TeamStatus status;

  ViewDetailTeamState(
      {required this.competitionId,
      required this.teamId,
      required this.valueTeamName,
      required this.valueTeamDescription,
      required this.status});

  ViewDetailTeamState copyWith(
      {required int newCompetitionId,
      required int newTeamId,
      required String newValueTeamName,
      required String newValueTeamDescription,
      required TeamStatus newStatus}) {
    return ViewDetailTeamState(
        competitionId: newCompetitionId,
        teamId: newTeamId,
        valueTeamName: newValueTeamName,
        valueTeamDescription: newValueTeamDescription,
        status: newStatus);
  }

  @override
  List<Object?> get props =>
      [competitionId, teamId, valueTeamName, valueTeamDescription, status];
}
