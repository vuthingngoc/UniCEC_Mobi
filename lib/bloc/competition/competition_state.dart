import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/competition/competition_detail_model.dart';
// import 'package:unicec_mobi/models/entities/competition/competition_model.dart';

import '../../models/entities/competition/competition_request_model.dart';
import '../../models/entities/competition/competition_show_model.dart';
import '../../models/enums/competition_scope_status.dart';

class CompetitionState extends Equatable {
  List<CompetitionShowModel> outStandingCompetitions;
  List<CompetitionShowModel> competitions;
  int? selectedCompetitionId;
  CompetitionDetailModel? competitionDetail;
  //CompetitionRequestModel requestModel;
  //Search
  String? searchName;
  CompetitionScopeStatus? scope;
  bool hasNext;
  int currentPage;

  CompetitionState(
      {required this.competitions,
      required this.outStandingCompetitions,
      required this.searchName,
      required this.scope,
      this.competitionDetail,
      this.selectedCompetitionId,
      required this.hasNext,
      required this.currentPage});

  CompetitionState copyWith({
    required List<CompetitionShowModel> competitions,
    required List<CompetitionShowModel> outStandingCompetitions,
    CompetitionDetailModel? competitionDetail,
    //required CompetitionRequestModel requestModel,
    required String? searchName,
    required CompetitionScopeStatus? scope,
    int? selectedCompetitionId,
    required bool newHasNext,
    required int newCurrentPage,
  }) {
    return CompetitionState(
        competitions: competitions,
        outStandingCompetitions: outStandingCompetitions,
        //requestModel: requestModel,
        searchName: searchName,
        scope: scope,
        competitionDetail: competitionDetail,
        selectedCompetitionId: selectedCompetitionId,
        hasNext: newHasNext,
        currentPage: newCurrentPage);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        competitions,
        outStandingCompetitions,
        //requestModel,
        searchName,
        scope,
        competitionDetail,
        selectedCompetitionId,
        hasNext,
        currentPage
      ];
}
