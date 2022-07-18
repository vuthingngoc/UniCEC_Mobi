import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';

class CompetitionState extends Equatable{
  CompetitionModel competition;

  CompetitionState({required this.competition});

  @override
  // TODO: implement props
  List<Object?> get props => [competition];

}