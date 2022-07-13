import 'package:unicec_mobi/models/entities/participant/participant_model.dart';
import 'package:unicec_mobi/models/enums/team_status.dart';

class TeamDetailModel{
  int id;
  int competitionId;
  String name;
  String description;
  String invitedCode;
  TeamStatus status;
  List<ParticipantModel> participants;

  TeamDetailModel({
    required this.id,
    required this.competitionId,
    required this.name,
    required this.description,
    required this.invitedCode,
    required this.status,
    required this.participants
  });

  factory TeamDetailModel.fromJson(Map<String, dynamic> json){
    int id = json['team_id'];
    int competitionId = json['competition_id'];
    String name = json['name'];
    String description = json['description'];
    String invitedCode = json['invited_code'];
    TeamStatus status = json['status'];
    List<ParticipantModel> participants = json['list_participant'];

    return TeamDetailModel(
      id: id, 
      competitionId: competitionId, 
      name: name, 
      description: description, 
      invitedCode: invitedCode, 
      status: status,
      participants: participants
    );
  }
}