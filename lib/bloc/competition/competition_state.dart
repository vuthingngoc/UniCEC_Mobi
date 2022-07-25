import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';

class CompetitionState extends Equatable{
  List<CompetitionModel> competitions;
  List<CompetitionModel> outStandingCompetitions;

  CompetitionState({required this.competitions, required  this.outStandingCompetitions});

  @override
  // TODO: implement props
  List<Object?> get props => [competitions, outStandingCompetitions];

}