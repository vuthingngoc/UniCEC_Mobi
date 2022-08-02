import '/models/enums/team_status.dart';

class TeamModel {
  int id;
  int competitionId;
  String name;
  String description;
  String invitedCode;
  TeamStatus status;
  int numberOfMemberInTeam;

  TeamModel(
      {required this.id,
      required this.competitionId,
      required this.name,
      required this.description,
      required this.invitedCode,
      required this.status,
      required this.numberOfMemberInTeam});

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    int id = json['team_id'];
    int competitionId = json['competition_id'];
    String name = json['name'];
    String description = json['description'];
    String invitedCode = json['invited_code'];
    TeamStatus status = json['status'];
    int numberOfMemberInTeam = json['number_of_member_in_team'];

    return TeamModel(
        id: id,
        competitionId: competitionId,
        name: name,
        description: description,
        invitedCode: invitedCode,
        status: status,
        numberOfMemberInTeam: numberOfMemberInTeam);
  }
}
