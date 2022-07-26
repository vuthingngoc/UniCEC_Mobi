import 'package:equatable/equatable.dart';
// import 'package:unicec_mobi/models/entities/competition/competition_model.dart';

import '../../models/entities/competition/competition_show_model.dart';

class CompetitionState extends Equatable {
  // List<CompetitionModel>? competitions;
  // List<CompetitionModel>? outStandingCompetitions;
  List<CompetitionShowModel>? outStandingCompetitions;
  List<CompetitionShowModel>? competitions;

  CompetitionState(
      {this.competitions, this.outStandingCompetitions});

  CompetitionState copyWith(
      {List<CompetitionShowModel>? competitions, List<CompetitionShowModel>? outStandingCompetitions}) {
    return CompetitionState(competitions: competitions, outStandingCompetitions: outStandingCompetitions);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [competitions, outStandingCompetitions];
}
