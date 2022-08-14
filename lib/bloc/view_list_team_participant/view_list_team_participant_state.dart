import 'package:equatable/equatable.dart';
import '../../models/entities/team/team_model.dart';
import '../../models/enums/team_status.dart';

class ViewListTeamParticipantState extends Equatable {
  List<TeamModel> listTeam;
  int competitionId;
  bool hasNext;
  int currentPage;
  String valueInvitedCode;
  //search
  String? searchName;
  TeamStatus? status;

  ViewListTeamParticipantState(
      {required this.listTeam,
      required this.competitionId,
      required this.currentPage,
      required this.hasNext,
      required this.valueInvitedCode,
      required this.searchName,
      required this.status});

  ViewListTeamParticipantState copyWith(
      {required List<TeamModel> newListTeam,
      required int newCompetitionId,
      required bool newHasNext,
      required int newCurrentPage,
      required String valueInvitedCode,
      required String? newSearchName,
      required TeamStatus? newStatus}) {
    return ViewListTeamParticipantState(
        listTeam: newListTeam,
        competitionId: newCompetitionId,
        hasNext: newHasNext,
        currentPage: newCurrentPage,
        valueInvitedCode: valueInvitedCode,
        searchName: newSearchName,
        status: newStatus);
  }

  @override
  List<Object?> get props => [
        listTeam,
        competitionId,
        hasNext,
        currentPage,
        valueInvitedCode,
        searchName,
        status
      ];
}
