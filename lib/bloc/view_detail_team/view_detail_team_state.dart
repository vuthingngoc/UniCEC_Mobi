import 'package:equatable/equatable.dart';

import '../../models/entities/participant/view_detail_participant.dart';
import '../../models/entities/team/team_detail_model.dart';
import '../../models/enums/team_status.dart';

class ViewDetailTeamState extends Equatable {
  TeamDetailModel? teamDetail;
  int competitionId;
  int teamId;
  int userIdIsLeaderTeam;
  String valueTeamName;
  String valueTeamDescription;
  TeamStatus status;

  ViewDetailTeamState(
      {required this.teamDetail,
      required this.competitionId,
      required this.teamId,
      required this.userIdIsLeaderTeam,
      required this.valueTeamName,
      required this.valueTeamDescription,
      required this.status});

  ViewDetailTeamState copyWith(
      {required TeamDetailModel? newTeamDetail,
      required int newCompetitionId,
      required int newTeamId,
      required int newUserIdLeaderTeam,
      required String newValueTeamName,
      required String newValueTeamDescription,
      required TeamStatus newStatus}) {
    return ViewDetailTeamState(
        teamDetail: newTeamDetail,
        competitionId: newCompetitionId,
        teamId: newTeamId,
        userIdIsLeaderTeam: newUserIdLeaderTeam,
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
        valueTeamName,
        valueTeamDescription,
        status
      ];
}
