class CompetitionEvent{}

class LoadOutStandingCompetitionEvent extends CompetitionEvent{}

class LoadCompetitionEvent extends CompetitionEvent{}

class SelectACompetitionEvent extends CompetitionEvent{
  final int competitionId;
  SelectACompetitionEvent({required this.competitionId});
}
