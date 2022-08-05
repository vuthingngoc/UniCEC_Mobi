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

//update team role
class UpdateMemberRoleEvent extends ViewDetailTeamEvent {
  final int participantInTeamId;
  UpdateMemberRoleEvent({required this.participantInTeamId});
}

//Delete Member by Team Leader
class DeleteMemberByTeamLeaderEvent extends ViewDetailTeamEvent {
  final participantId;
  DeleteMemberByTeamLeaderEvent({required this.participantId});
}

//Member Out Team
class MemberOutTeamEvent extends ViewDetailTeamEvent {}

//Delete Team
class DeleteTeamByLeaderEvent extends ViewDetailTeamEvent {}

//show lỗi
class ShowingSnackBarEvent extends ViewDetailTeamEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}

//back lại trang trước
class BackPreviousPageEvent extends ViewDetailTeamEvent {}
