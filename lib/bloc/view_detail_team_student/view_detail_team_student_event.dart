class ViewDetailTeamStudentEvent {}

class RecieveDataEvent extends ViewDetailTeamStudentEvent {
  int competitionId;
  int teamId;
  RecieveDataEvent({required this.teamId, required this.competitionId});
}

class ClickToViewInfoEvent extends ViewDetailTeamStudentEvent {
  int userId;
  ClickToViewInfoEvent({required this.userId});
}

class NavigatorToAccountPageEvent extends ViewDetailTeamStudentEvent {
  int userId;
  NavigatorToAccountPageEvent({required this.userId});
}
