import 'package:equatable/equatable.dart';
import '../../models/entities/team/team_model.dart';

class ViewListTeamState extends Equatable {
  List<TeamModel> listTeam;
  int competitionId;
  bool hasNext;
  int currentPage;
  String valueTeamName;
  String valueTeamDescription;
  String valueInvitedCode;

  ViewListTeamState(
      {required this.listTeam,
      required this.competitionId,
      required this.currentPage,
      required this.hasNext,
      required this.valueTeamName,
      required this.valueTeamDescription,
      required this.valueInvitedCode});

  ViewListTeamState copyWith(
      {required List<TeamModel> newListTeam,
      required int newCompetitionId,
      required bool newHasNext,
      required int newCurrentPage,
      required String valueTeamName,
      required String valueTeamDescription,
      required String valueInvitedCode}) {
    return ViewListTeamState(
        listTeam: newListTeam,
        competitionId: newCompetitionId,
        hasNext: newHasNext,
        currentPage: newCurrentPage,
        valueTeamName: valueTeamName,
        valueTeamDescription: valueTeamDescription,
        valueInvitedCode: valueInvitedCode);
  }

  @override
  List<Object?> get props => [
        listTeam,
        competitionId,
        hasNext,
        currentPage,
        valueTeamName,
        valueTeamDescription,
        valueInvitedCode
      ];
}
