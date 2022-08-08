import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/competition/competition_detail_model.dart';
// import 'package:unicec_mobi/models/entities/competition/competition_model.dart';

import '../../models/entities/competition/competition_request_model.dart';
import '../../models/entities/competition/competition_show_model.dart';

class CompetitionState extends Equatable {
  List<CompetitionShowModel>? outStandingCompetitions;
  List<CompetitionShowModel>? competitions;
  int? selectedCompetitionId;
  CompetitionDetailModel? competitionDetail;
  CompetitionRequestModel? requestModel;

  CompetitionState(
      {this.competitions,
      this.outStandingCompetitions,
      this.requestModel,
      this.competitionDetail,
      this.selectedCompetitionId});

  CompetitionState copyWith(
      {List<CompetitionShowModel>? competitions,
      List<CompetitionShowModel>? outStandingCompetitions,
      CompetitionDetailModel? competitionDetail,
      int? selectedCompetitionId}) {
    return CompetitionState(
        competitions: competitions,
        outStandingCompetitions: outStandingCompetitions,
        requestModel: requestModel,
        competitionDetail: competitionDetail,
        selectedCompetitionId: selectedCompetitionId);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        competitions,
        outStandingCompetitions,
        requestModel,
        competitionDetail,
        selectedCompetitionId
      ];
}
