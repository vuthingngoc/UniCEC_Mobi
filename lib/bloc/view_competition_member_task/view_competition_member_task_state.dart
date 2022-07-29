import 'package:equatable/equatable.dart';

import '../../models/entities/competition/competition_model.dart';

class ViewCompetitionMemberTaskState extends Equatable {
  List<CompetitionModel> listCompetition;
  bool hasNext;
  int currentPage;

  ViewCompetitionMemberTaskState(
      {required this.listCompetition,
      required this.hasNext,
      required this.currentPage});

  ViewCompetitionMemberTaskState copyWith(
      {required List<CompetitionModel> listCompetition,
      required bool hasNext,
      required int currentPage}) {
    return ViewCompetitionMemberTaskState(
        listCompetition: listCompetition,
        hasNext: hasNext,
        currentPage: currentPage);
  }

  @override
  List<Object?> get props => [listCompetition, hasNext, currentPage];
}
