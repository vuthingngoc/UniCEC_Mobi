import '../../models/enums/team_status.dart';

class ViewDetailTeamParticipantEvent {}

class RecieveDataEvent extends ViewDetailTeamParticipantEvent {
  int competitionId;
  int teamId;
  RecieveDataEvent({required this.teamId, required this.competitionId});
}

//get description
class ChangeTeamDescriptionValueEvent extends ViewDetailTeamParticipantEvent {
  final String newDescriptionValue;
  ChangeTeamDescriptionValueEvent({required this.newDescriptionValue});
}

//get team name
class ChangeTeamNameValueEvent extends ViewDetailTeamParticipantEvent {
  final String newNameValue;
  ChangeTeamNameValueEvent({required this.newNameValue});
}

class UpdateTeamNameAndDescriptionEvent extends ViewDetailTeamParticipantEvent {
}

class UpdateStatusTeam extends ViewDetailTeamParticipantEvent {
  final TeamStatus status;
  UpdateStatusTeam({required this.status});
}

//update team role
class UpdateMemberRoleEvent extends ViewDetailTeamParticipantEvent {
  final int participantInTeamId;
  UpdateMemberRoleEvent({required this.participantInTeamId});
}

//Delete Member by Team Leader
class DeleteMemberByTeamLeaderEvent extends ViewDetailTeamParticipantEvent {
  final participantId;
  DeleteMemberByTeamLeaderEvent({required this.participantId});
}

//Member Out Team
class MemberOutTeamEvent extends ViewDetailTeamParticipantEvent {}

//Delete Team
class DeleteTeamByLeaderEvent extends ViewDetailTeamParticipantEvent {}

//show lỗi
class ShowingSnackBarEvent extends ViewDetailTeamParticipantEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}

//back lại trang trước
class BackPreviousPageEvent extends ViewDetailTeamParticipantEvent {}

class ClickToViewInfoEvent extends ViewDetailTeamParticipantEvent {
  int userId;
  ClickToViewInfoEvent({required this.userId});
}

class NavigatorToAccountPageEvent extends ViewDetailTeamParticipantEvent {
  int userId;
  NavigatorToAccountPageEvent({required this.userId});
}
