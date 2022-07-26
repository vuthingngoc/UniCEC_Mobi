import 'package:unicec_mobi/models/enums/competition_round_status.dart';

class CompetitionRoundModel{
  int id;
  int competitionId;
  String title;
  String description;
  // DateTime startTime;
  // DateTime endTime;
  String startTime;
  String endTime;
  int numberOfTeam;
  int seedsPoint;
  CompetitionRoundStatus status;

  CompetitionRoundModel({
    required this.id,
    required this.competitionId,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.numberOfTeam,
    required this.seedsPoint,
    required this.status
  });

  factory CompetitionRoundModel.fromJson(Map<String, dynamic> json){
    int id = json['id'];
    int competitionId = json['competition_id'];
    String title = json['title'];
    String description = json['description'];
    // DateTime startTime = DateTime.parse(json['start_time']);
    // DateTime endTime = DateTime.parse(json['end_time']);
    String startTime = json['start_time'];
    String endTime = json['end_time'];
    int numberOfTeam = json['number_of_team'];
    int seedsPoint = json['seeds_point'];
    CompetitionRoundStatus status = json['status'];

    return CompetitionRoundModel(
      id: id, 
      competitionId: competitionId, 
      title: title, 
      description: description, 
      startTime: startTime, 
      endTime: endTime, 
      numberOfTeam: numberOfTeam, 
      seedsPoint: seedsPoint, 
      status: status
    );
  }
}