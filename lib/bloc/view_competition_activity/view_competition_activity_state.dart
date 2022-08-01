import 'package:equatable/equatable.dart';

import '../../models/entities/competition_activity/competition_activity_model.dart';

class ViewCompetitionActivityState extends Equatable {
  List<CompetitionActivityModel> listCompetitionActivity;
  int competitionId;
  bool hasNext;
  int currentPage;

  ViewCompetitionActivityState(
      {required this.listCompetitionActivity,
      required this.competitionId,
      required this.hasNext,
      required this.currentPage});

  ViewCompetitionActivityState copyWith({
    required List<CompetitionActivityModel> newListCompetitionActivity,
    required int newCompetitionId,
    required bool newHasNext,
    required int newCurrentPage,
  }) {
    return ViewCompetitionActivityState(
        listCompetitionActivity: newListCompetitionActivity,
        competitionId: newCompetitionId,
        hasNext: newHasNext,
        currentPage: newCurrentPage);
  }

  @override
  List<Object?> get props =>
      [listCompetitionActivity, competitionId, hasNext, currentPage];
}
