import '../../models/enums/team_status.dart';

class ViewListTeamParticipantEvent {}

class ViewListTeamInitEvent extends ViewListTeamParticipantEvent {}

//recieve data
class RecieveDataEvent extends ViewListTeamParticipantEvent {
  int competitionId;
  RecieveDataEvent({required this.competitionId});
}

//LoadMore
class IncrementalEvent extends ViewListTeamParticipantEvent {}

class RefreshEvent extends ViewListTeamParticipantEvent {}

class LoadAddMoreEvent extends ViewListTeamParticipantEvent {}

//get value invited code
class ChangeInvitedCodeValueEvent extends ViewListTeamParticipantEvent {
  final String newInvitedCodeValue;
  ChangeInvitedCodeValueEvent({required this.newInvitedCodeValue});
}

//create team
class CreateTeamEvent extends ViewListTeamParticipantEvent {
  final String teamName;
  final String teamDescription;
  CreateTeamEvent({required this.teamName, required this.teamDescription});
}

//join team
class JoinTeamEvent extends ViewListTeamParticipantEvent {}

//Navigate to team detail
class NavigatorTeamDetailPageEvent extends ViewListTeamParticipantEvent {
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
class ShowingSnackBarEvent extends ViewListTeamParticipantEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}

class RebuildListViewTeamEvent extends ViewListTeamParticipantEvent {}
