class ParticipantInTeamModel{
  int id;
  int teamId;
  int participantId;
  int competitionId;

  ParticipantInTeamModel({
    required this.id,
    required this.teamId,
    required this.participantId,
    required this.competitionId
  });

  factory ParticipantInTeamModel.fromJson(Map<String, dynamic> json){
    int id = json['id'];
    int teamId = json['team_id'];
    int participantId = json['participant_id'];
    int competitionId = json['competition_id'];

    return ParticipantInTeamModel(
      id: id, 
      teamId: teamId, 
      participantId: participantId, 
      competitionId: competitionId
    );
  }
}