import 'package:unicec_mobi/models/entities/competition/competition_in_clubs_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_in_majors_model.dart';

import '../../enums/competition_scope_status.dart';
import '../../enums/competition_status.dart';
import '../competition_entity/competition_entity_model.dart';

class CompetitionDetailModel {
  int id;
  int universityId;
  String name;
  int competitionTypeId;
  String competitionTypeName;
  double fee;
  String seedsCode;
  double seedsPoint;
  double seedsDeposited;
  int numberOfParticipation;
  int? numberOfTeam;
  DateTime createTime;
  DateTime startTimeRegister;
  DateTime endTimeRegister;
  DateTime startTime;
  DateTime endTime;
  String addressName;
  String address;
  String content;
  bool isSponsor;
  CompetitionScopeStatus scope;
  CompetitionStatus status;
  int view;
  List<CompetitionInClubsModel> clubsInCompetition;
  List<CompetitionInMajorsModel> majorsInCompetition;
  List<CompetitionEntityModel> competitionEntities;

  CompetitionDetailModel(
      {required this.id,
      required this.universityId,
      required this.name,
      required this.competitionTypeId,
      required this.competitionTypeName,
      required this.fee,
      required this.seedsCode,
      required this.seedsPoint,
      required this.seedsDeposited,
      required this.numberOfParticipation,
      this.numberOfTeam,
      required this.createTime,
      required this.startTimeRegister,
      required this.endTimeRegister,
      required this.startTime,
      required this.endTime,
      required this.addressName,
      required this.address,
      required this.content,
      required this.isSponsor,
      required this.scope,
      required this.status,
      required this.view,
      required this.clubsInCompetition,
      required this.majorsInCompetition,
      required this.competitionEntities});

  factory CompetitionDetailModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    int universityId = json['university_id'];
    String name = json['name'];
    int competitionTypeId = json['competition_type_id'];
    String competitionTypeName = json['competition_type_name'];
    double fee = json['fee'];
    String seedsCode = json['seeds_code'];
    double seedsPoint = json['seeds_point'];
    double seedsDeposited = json['seeds_deposited'];
    int numberOfParticipation = json['number_of_participations'];
    int? numberOfTeam = json['number_of_team'];
    DateTime createTime = DateTime.parse(json['create_time']);
    DateTime startTimeRegister = DateTime.parse(json['start_time_register']);
    DateTime endTimeRegister = DateTime.parse(json['end_time_register']);
    DateTime startTime = DateTime.parse(json['start_time']);
    DateTime endTime = DateTime.parse(json['end_time']);
    String addressName = json['address_name'];
    String address = json['address'];
    String content = json['content'];
    bool isSponsor = json['is_sponsor'];
    CompetitionScopeStatus scope = json['scope'];
    CompetitionStatus status =
        CompetitionStatus.values[int.parse(json['status'].toString())];
    int view = json['view'];
    List<CompetitionInClubsModel> competitionInClub =
        json['clubs_in_competition'];
    List<CompetitionInMajorsModel> competitionInDepartment =
        json['departments_in_competition'];
    List<CompetitionEntityModel> competitionEntities =
        json['competition_entities'];

    return CompetitionDetailModel(
        id: id,
        universityId: universityId,
        name: name,
        competitionTypeId: competitionTypeId,
        competitionTypeName: competitionTypeName,
        fee: fee,
        seedsCode: seedsCode,
        seedsPoint: seedsPoint,
        seedsDeposited: seedsDeposited,
        numberOfParticipation: numberOfParticipation,
        numberOfTeam: numberOfTeam,
        createTime: createTime,
        startTimeRegister: startTimeRegister,
        endTimeRegister: endTimeRegister,
        startTime: startTime,
        endTime: endTime,
        addressName: addressName,
        content: content,
        address: address,        
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
