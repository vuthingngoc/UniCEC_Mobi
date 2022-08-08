class CompetitionDetailEvent{}

class LoadCompetitionDetailEvent extends CompetitionDetailEvent{
  int competitionId;
  LoadCompetitionDetailEvent({required this.competitionId});
}

class ParticipateTheCompetitionEvent extends CompetitionDetailEvent{
  int competitionId;
  ParticipateTheCompetitionEvent({required this.competitionId});
}