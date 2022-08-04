import '../../models/enums/team_status.dart';

class ViewDetailTeamEvent {}

class RecieveDataEvent extends ViewDetailTeamEvent {
  int competitionId;
  int teamId;
  RecieveDataEvent({required this.teamId, required this.competitionId});
}

//get description
class ChangeTeamDescriptionValueEvent extends ViewDetailTeamEvent {
  final String newDescriptionValue;
  ChangeTeamDescriptionValueEvent({required this.newDescriptionValue});
}

//get team name
class ChangeTeamNameValueEvent extends ViewDetailTeamEvent {
  final String newNameValue;
  ChangeTeamNameValueEvent({required this.newNameValue});
}

class UpdateTeamNameAndDescriptionEvent extends ViewDetailTeamEvent {}

class UpdateStatusTeam extends ViewDetailTeamEvent {
  final TeamStatus status;
  UpdateStatusTeam({required this.status});
}

//show lỗi
class ShowingSnackBarEvent extends ViewDetailTeamEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}
