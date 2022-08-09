import 'package:equatable/equatable.dart';
import '../../models/entities/competition/competition_model.dart';
import '../../models/enums/competition_scope_status.dart';

class ViewListCompetitionParticipantState extends Equatable {
  List<CompetitionModel> competitions;
  //Search
  String? searchName;
  CompetitionScopeStatus? scope;
  bool? isEvent;
  bool hasNext;
  int currentPage;

  ViewListCompetitionParticipantState(
      {required this.competitions,
      required this.searchName,
      required this.scope,
      required this.isEvent,
      required this.hasNext,
      required this.currentPage});

  ViewListCompetitionParticipantState copyWith(
      {required List<CompetitionModel> newCompetitions,
      required String? newSearchName,
      required CompetitionScopeStatus? newScope,
      required bool? newIsEvent,
      required bool newHasNext,
      required int newCurrentPage}) {
    return ViewListCompetitionParticipantState(
        competitions: newCompetitions,
        searchName: newSearchName,
        scope: newScope,
        isEvent: newIsEvent,
        hasNext: newHasNext,
        currentPage: newCurrentPage);
  }

  @override
  List<Object?> get props =>
      [competitions, searchName, scope, isEvent, hasNext, currentPage];
}
