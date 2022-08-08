class ViewDetailTeamStudentEvent {}

class RecieveDataEvent extends ViewDetailTeamStudentEvent {
  int competitionId;
  int teamId;
  RecieveDataEvent({required this.teamId, required this.competitionId});
}
