import 'package:equatable/equatable.dart';
import '../../models/entities/team/team_model.dart';

class ViewListTeamParticipantState extends Equatable {
  List<TeamModel> listTeam;
  int competitionId;
  bool hasNext;
  int currentPage;
  String valueInvitedCode;

  ViewListTeamParticipantState(
      {required this.listTeam,
      required this.competitionId,
      required this.currentPage,
      required this.hasNext,
      required this.valueInvitedCode});

  ViewListTeamParticipantState copyWith(
      {required List<TeamModel> newListTeam,
      required int newCompetitionId,
      required bool newHasNext,
      required int newCurrentPage,
      required String valueInvitedCode}) {
    return ViewListTeamParticipantState(
        listTeam: newListTeam,
        competitionId: newCompetitionId,
        hasNext: newHasNext,
        currentPage: newCurrentPage,
        valueInvitedCode: valueInvitedCode);
  }

  @override
  List<Object?> get props =>
      [listTeam, competitionId, hasNext, currentPage, valueInvitedCode];
}
