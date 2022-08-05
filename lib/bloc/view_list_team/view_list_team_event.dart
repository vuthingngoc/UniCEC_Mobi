import '../../models/enums/team_status.dart';

class ViewListTeamEvent {}

class ViewListTeamInitEvent extends ViewListTeamEvent {}

//recieve data
class RecieveDataEvent extends ViewListTeamEvent {
  int competitionId;
  RecieveDataEvent({required this.competitionId});
}

//LoadMore
class IncrementalEvent extends ViewListTeamEvent {}

class RefreshEvent extends ViewListTeamEvent {}

class LoadAddMoreEvent extends ViewListTeamEvent {}

//get value invited code
class ChangeInvitedCodeValueEvent extends ViewListTeamEvent {
  final String newInvitedCodeValue;
  ChangeInvitedCodeValueEvent({required this.newInvitedCodeValue});
}

//create team
class CreateTeamEvent extends ViewListTeamEvent {
  final String teamName;
  final String teamDescription;
  CreateTeamEvent({required this.teamName, required this.teamDescription});
}

//join team
class JoinTeamEvent extends ViewListTeamEvent {}

//Navigate to team detail
class NavigatorTeamDetailPageEvent extends ViewListTeamEvent {
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

//show lỗi
class ShowingSnackBarEvent extends ViewListTeamEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}

class RebuildListViewTeamEvent extends ViewListTeamEvent {}
