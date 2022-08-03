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

//get description
class ChangeTeamDescriptionValueEvent extends ViewListTeamEvent {
  final String newDescriptionValue;
  ChangeTeamDescriptionValueEvent({required this.newDescriptionValue});
}

//get team name
class ChangeTeamNameValueEvent extends ViewListTeamEvent {
  final String newNameValue;
  ChangeTeamNameValueEvent({required this.newNameValue});
}

//get value invited code
class ChangeInvitedCodeValueEvent extends ViewListTeamEvent {
  final String newInvitedCodeValue;
  ChangeInvitedCodeValueEvent({required this.newInvitedCodeValue});
}

//create team
class CreateTeamEvent extends ViewListTeamEvent {
  // final int competitionId;
  // CreateTeamEvent({required this.competitionId});
}

//join team
class JoinTeamEvent extends ViewListTeamEvent {}

//Navigate to team detail
class NavigatorTeamDetailPageEvent extends ViewListTeamEvent {
  int teamId;
  NavigatorTeamDetailPageEvent({required this.teamId});
}

//show lỗi
class ShowingSnackBarEvent extends ViewListTeamEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}
