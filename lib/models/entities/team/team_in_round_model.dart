import 'package:unicec_mobi/models/entities/participant/participant_in_team_model.dart';

class TeamInRoundModel{
  int id;
  int teamId;
  String teamName;
  int roundId;
  int scores;
  bool status;
  int rank;
  List<ParticipantInTeamModel> membersInTeam;

  TeamInRoundModel({
    required this.id,
    required this.teamId,
    required this.teamName,
    required this.roundId,
    required this.scores,
    required this.status,
    required this.rank,
    required this.membersInTeam
  });

  factory TeamInRoundModel.fromJson(Map<String, dynamic> json){
    int id = json['id'];
    int teamId = json['team_id'];
    String teamName = json['team_name'];
    int roundId = json['round_id'];
    int scores = json['scores'];
    bool status = json['status'];
    int rank = json['rank'];
    List<ParticipantInTeamModel> membersInTeam = json['members_in_team'];

    return TeamInRoundModel(
      id: id, 
      teamId: teamId, 
      teamName: teamName, 
      roundId: roundId, 
      scores: scores, 
      status: status, 
      rank: rank, 
      membersInTeam: membersInTeam
    );
  }
}