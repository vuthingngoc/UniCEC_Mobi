import 'package:flutter/cupertino.dart';
import 'package:unicec_mobi/models/entities/activities_entity/activities_entity_model.dart';
import 'package:unicec_mobi/models/entities/member/member_takes_activity_model.dart';
import 'package:unicec_mobi/models/enums/competition_activity_status.dart';
import 'package:unicec_mobi/models/enums/priority_status.dart';

class CompetitionActivityDetailModel {
  int id;
  int competitionId;
  double seedsPoint;
  DateTime createTime;
  DateTime ending;
  String name;
  String description;
  PriorityStatus priority;
  CompetitionActivityStatus status;
  int numOfMember;
  int creatorId;
  String creatorName;
  String creatorEmail;
  List<ActivitiesEntityModel> activitiesEntities;
  List<MemberTakesActivityModel> memberTakesActivities;

  CompetitionActivityDetailModel(
      {required this.id,
      required this.competitionId,
      required this.seedsPoint,
      required this.createTime,
      required this.ending,
      required this.name,
      required this.description,
      required this.priority,
      required this.status,
      required this.numOfMember,
      required this.creatorId,
      required this.creatorName,
      required this.creatorEmail,
      required this.activitiesEntities,
      required this.memberTakesActivities});

  factory CompetitionActivityDetailModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    int competitionId = json['competition_id'];
    double seedsPoint = json['seeds_point'];
    DateTime createTime = json['create_time'];
    DateTime ending = json['ending'];
    String name = json['name'];
    String description = json['description'];
    PriorityStatus priority = json['priority'];
    CompetitionActivityStatus status = json['status'];
    int numOfMember = json['num_of_member'];
    int creatorId = json['creator_id'];
    String creatorName = json['creator_name'];
    String creatorEmail = json['creator_email'];
    List<ActivitiesEntityModel> activitiesEntities = json['activities_entities'];
    List<MemberTakesActivityModel> memberTakesActivities = json['member_takes_activities'];

    return CompetitionActivityDetailModel(
      id: id, 
      competitionId: competitionId, 
      seedsPoint: seedsPoint, 
      createTime: createTime, 
      ending: ending, 
      name: name, 
      description: description, 
      priority: priority, 
      status: status, 
      numOfMember: numOfMember, 
      creatorId: creatorId, 
      creatorName: creatorName, 
      creatorEmail: creatorEmail, 
      activitiesEntities: activitiesEntities, 
      memberTakesActivities: memberTakesActivities
    );
  }
}
