import 'package:equatable/equatable.dart';
import '../../models/entities/team/team_detail_model.dart';
import '../../models/enums/team_status.dart';

class ViewDetailTeamStudentState extends Equatable {
  TeamDetailModel? teamDetail;
  int competitionId;
  int teamId;
  int userIdIsLeaderTeam;
  int userIdInTeam;
  String valueTeamName;
  String valueTeamDescription;
  TeamStatus status;

  ViewDetailTeamStudentState(
      {required this.teamDetail,
      required this.competitionId,
      required this.teamId,
      required this.userIdIsLeaderTeam,
      required this.userIdInTeam,
      required this.valueTeamName,
      required this.valueTeamDescription,
      required this.status});

  ViewDetailTeamStudentState copyWith(
      {required TeamDetailModel? newTeamDetail,
      required int newCompetitionId,
      required int newTeamId,
      required int newUserIdLeaderTeam,
      required int newUserIdInTeam,
      required String newValueTeamName,
      required String newValueTeamDescription,
      required TeamStatus newStatus}) {
    return ViewDetailTeamStudentState(
        teamDetail: newTeamDetail,
        competitionId: newCompetitionId,
        teamId: newTeamId,
        userIdIsLeaderTeam: newUserIdLeaderTeam,
        userIdInTeam: newUserIdInTeam,
        valueTeamName: newValueTeamName,
        valueTeamDescription: newValueTeamDescription,
        status: newStatus);
  }

  @override
  List<Object?> get props => [
        teamDetail,
        competitionId,
        teamId,
        userIdIsLeaderTeam,
        userIdInTeam,
        valueTeamName,
        valueTeamDescription,
        status
      ];
}
