import 'package:equatable/equatable.dart';
import '../../models/entities/team/team_model.dart';

class ViewListTeamStudentState extends Equatable {
  List<TeamModel> listTeam;
  int competitionId;
  bool hasNext;
  int currentPage;

  ViewListTeamStudentState({
    required this.listTeam,
    required this.competitionId,
    required this.currentPage,
    required this.hasNext,
  });

  ViewListTeamStudentState copyWith({
    required List<TeamModel> newListTeam,
    required int newCompetitionId,
    required bool newHasNext,
    required int newCurrentPage,
  }) {
    return ViewListTeamStudentState(
      listTeam: newListTeam,
      competitionId: newCompetitionId,
      hasNext: newHasNext,
      currentPage: newCurrentPage,
    );
  }

  @override
  List<Object?> get props => [listTeam, competitionId, hasNext, currentPage];
}
