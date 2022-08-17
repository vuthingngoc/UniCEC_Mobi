import '../../models/enums/team_status.dart';

class ViewListTeamStudentEvent {}

class ViewListTeamInitEvent extends ViewListTeamStudentEvent {}

//recieve data
class RecieveDataEvent extends ViewListTeamStudentEvent {
  int competitionId;
  RecieveDataEvent({required this.competitionId});
}

//LoadMore
class IncrementalEvent extends ViewListTeamStudentEvent {}

class RefreshEvent extends ViewListTeamStudentEvent {}

class LoadAddMoreEvent extends ViewListTeamStudentEvent {}

//Navigate to team detail
class NavigatorTeamDetailPageEvent extends ViewListTeamStudentEvent {
  int teamId;
  int competitionId;
  String teamName;
  String teamDescription;
  TeamStatus status;
  NavigatorTeamDetailPageEvent(
      {required this.teamId,
      required this.competitionId,
      required this.teamName,
      required this.teamDescription,
      required this.status});
}

class LoadingEvent extends ViewListTeamStudentEvent {}
