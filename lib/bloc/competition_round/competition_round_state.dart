import 'package:equatable/equatable.dart';

import '../../models/entities/competition_round/competition_round_model.dart';

class CompetitionRoundState extends Equatable {
  List<CompetitionRoundModel>? competitionRounds;

  CompetitionRoundState({this.competitionRounds});

  CompetitionRoundState copyWith(
      {List<CompetitionRoundModel>? competitionRoundModel}) {
    return CompetitionRoundState(competitionRounds: competitionRoundModel);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [competitionRounds];
}
