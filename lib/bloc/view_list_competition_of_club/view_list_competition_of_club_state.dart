import 'package:equatable/equatable.dart';

import '../../models/entities/competition/competition_detail_model.dart';
import '../../models/entities/competition/competition_show_model.dart';
import '../../models/enums/competition_scope_status.dart';

class ViewListCompetitionOfClubState extends Equatable {
  List<CompetitionShowModel> outStandingCompetitions;
  List<CompetitionShowModel> competitions;
  int? selectedCompetitionId;
  //Search
  CompetitionScopeStatus scope;
  String? searchName;
  bool? isEvent;
  bool hasNext;
  int currentPage;
  bool isLoading;

  ViewListCompetitionOfClubState(
      {required this.competitions,
      required this.outStandingCompetitions,
      required this.searchName,
      required this.scope,
      required this.isEvent,
      this.selectedCompetitionId,
      required this.hasNext,
      required this.currentPage,
      required this.isLoading});

  ViewListCompetitionOfClubState copyWith({
    required List<CompetitionShowModel> competitions,
    required List<CompetitionShowModel> outStandingCompetitions,
    required String? searchName,
    required CompetitionScopeStatus scope,
    required bool? isEvent,
    int? selectedCompetitionId,
    required bool newHasNext,
    required int newCurrentPage,
    required bool isLoading,
  }) {
    return ViewListCompetitionOfClubState(
        competitions: competitions,
        outStandingCompetitions: outStandingCompetitions,
        searchName: searchName,
        scope: scope,
        isEvent: isEvent,
        selectedCompetitionId: selectedCompetitionId,
        hasNext: newHasNext,
        currentPage: newCurrentPage,
        isLoading: isLoading);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        competitions,
        outStandingCompetitions,
        searchName,
        scope,
        isEvent,
        selectedCompetitionId,
        hasNext,
        currentPage,
        isLoading
      ];
}
