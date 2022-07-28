import 'package:unicec_mobi/models/enums/competition_activity_status.dart';
import 'package:unicec_mobi/models/enums/priority_status.dart';

import '../activities_entity/activities_entity_model.dart';

class CompetitionActivityModel{
  int id;
  int competitionId;
  // DateTime createTime;
  // DateTime ending;
  String createTime;
  String ending;
  String name;
  String assigner;
  PriorityStatus priority;
  CompetitionActivityStatus status;
  // List<ActivitiesEntityModel> activitiesEntity;

  CompetitionActivityModel({
    required this.id,
    required this.competitionId,
    required this.createTime,
    required this.ending,
    required this.name,
    required this.assigner,
    required this.priority,
    required this.status,
    // required this.activitiesEntity
  });

  factory CompetitionActivityModel.fromJson(Map<String, dynamic> json){
    int id = json['id'];
    int competitionId = json['competition_id'];
    // DateTime createTime = DateTime.parse(json['create_time']);
    // DateTime ending = DateTime.parse(json['ending']);
    String createTime = json['create_time'];
    String ending = json['ending'];
    String name = json['name'];
    String assigner = json['assigner'];
    PriorityStatus priority = json['priority'];
    CompetitionActivityStatus status = json['competition_activity_status'];
    // List<ActivitiesEntityModel> activitiesEntity = json['activities_entities'];

    return CompetitionActivityModel(
      id: id, 
      competitionId: competitionId, 
      createTime: createTime, 
      ending: ending, 
      name: name,
      assigner: assigner,
      priority: priority, 
      status: status, 
      // activitiesEntity: activitiesEntity
    );
  }
  
}