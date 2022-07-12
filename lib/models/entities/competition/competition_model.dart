import 'package:unicec_mobi/models/entities/competition/competition_in_clubs_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_in_majors_model.dart';

import '../../enums/competition_scope_status.dart';
import '../../enums/competition_status.dart';
import '../competition_entity/competition_entity_model.dart';

class CompetitionModel {
  int id;
  int universityId;
  String name;
  int competitionTypeId;
  String competitionTypeName;
  DateTime createTime;
  DateTime startTime;
  bool isSponsor;
  CompetitionScopeStatus scope;
  CompetitionStatus status;
  int view;
  List<CompetitionInClubsModel> clubsInCompetition;
  List<CompetitionInMajorsModel> majorsInCompetition;
  List<CompetitionEntityModel> competitionEntities;

  CompetitionModel(
      {required this.id,
      required this.universityId,
      required this.name,
      required this.competitionTypeId,
      required this.competitionTypeName,
      required this.createTime,
      required this.startTime,
      required this.isSponsor,
      required this.scope,
      required this.status,
      required this.view,
      required this.clubsInCompetition,
      required this.majorsInCompetition,
      required this.competitionEntities});

  factory CompetitionModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    int universityId = json['university_id'];
    String name = json['name'];
    int competitionTypeId = json['competition_type_id'];
    String competitionTypeName = json['competition_type_name'];
    DateTime createTime = json['create_time'];
    DateTime startTime = DateTime.parse(json['start_time']);
    bool isSponsor = json['is_sponsor'];
    CompetitionScopeStatus scope = json['scope'];
    CompetitionStatus status = CompetitionStatus.values[int.parse(json['status'].toString())];
    int view = json['view'];
    List<CompetitionInClubsModel> competitionInClub = json['clubs_in_competition'];
    List<CompetitionInMajorsModel> competitionInDepartment = json['majors_in_competition'];
    List<CompetitionEntityModel> competitionEntities = json['competition_entities'];

    return CompetitionModel(
      id: id, 
      universityId: universityId, 
      name: name, 
      competitionTypeId: competitionTypeId,
      competitionTypeName: competitionTypeName,
      createTime: createTime, 
      startTime: startTime, 
      isSponsor: isSponsor, 
      scope: scope, 
      status: status, 
      view: view, 
      clubsInCompetition: competitionInClub, 
      majorsInCompetition: competitionInDepartment, 
      competitionEntities: competitionEntities
    );
  }
}
