class CompetitionDetailEvent{}

class LoadCompetitionDetailEvent extends CompetitionDetailEvent{
  int competitionId;
  LoadCompetitionDetailEvent({required this.competitionId});
}

class ParticipateTheCompetitionEvent extends CompetitionDetailEvent{
  int competitionId;
  ParticipateTheCompetitionEvent({required this.competitionId});
}

class AttendanceCompetitionEvent extends CompetitionDetailEvent{
  String seedsCode;

  AttendanceCompetitionEvent({required this.seedsCode});
}

class ShowPopUpAnnouncement extends CompetitionDetailEvent{
  String message;

  ShowPopUpAnnouncement({required this.message});
}