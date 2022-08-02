import 'package:equatable/equatable.dart';
import '../../models/entities/team/team_model.dart';

class ViewListTeamState extends Equatable {
  List<TeamModel> listTeam;
  int competitionId;
  bool hasNext;
  int currentPage;

  ViewListTeamState(
      {required this.listTeam,
      required this.competitionId,
      required this.currentPage,
      required this.hasNext});

  ViewListTeamState copyWith(
      {required List<TeamModel> newListTeam,
      required int newCompetitionId,
      required bool newHasNext,
      required int newCurrentPage}) {
    return ViewListTeamState(
        listTeam: newListTeam,
        competitionId: newCompetitionId,
        hasNext: newHasNext,
        currentPage: newCurrentPage);
  }

  @override
  List<Object?> get props => [listTeam, competitionId, hasNext, currentPage];
}
