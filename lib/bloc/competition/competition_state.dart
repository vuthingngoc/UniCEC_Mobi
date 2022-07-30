import 'package:equatable/equatable.dart';
// import 'package:unicec_mobi/models/entities/competition/competition_model.dart';

import '../../models/entities/competition/competition_request_model.dart';
import '../../models/entities/competition/competition_show_model.dart';

class CompetitionState extends Equatable {
  List<CompetitionShowModel>? outStandingCompetitions;
  List<CompetitionShowModel>? competitions;
  CompetitionRequestModel? requestModel;

  CompetitionState(
      {this.competitions, this.outStandingCompetitions, this.requestModel});

  CompetitionState copyWith(
      {List<CompetitionShowModel>? competitions, List<CompetitionShowModel>? outStandingCompetitions}) {
    return CompetitionState(competitions: competitions, outStandingCompetitions: outStandingCompetitions, requestModel: requestModel);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [competitions, outStandingCompetitions, requestModel];
}
