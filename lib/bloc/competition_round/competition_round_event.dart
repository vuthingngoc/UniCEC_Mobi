class CompetitionRoundEvent{}

class LoadRoundsByCompetition extends CompetitionRoundEvent{
  int competitionId;
  LoadRoundsByCompetition({required this.competitionId});
}