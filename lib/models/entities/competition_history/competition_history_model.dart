import 'package:unicec_mobi/models/enums/competition_status.dart';

class CompetitionHistoryModel{
  int id;
  int competitionId;
  int? changerId;
  String? changerName;
  DateTime changeDate;
  String? description;
  CompetitionStatus status;

  CompetitionHistoryModel({
    required this.id,
    required this.competitionId,
    this.changerId,
    this.changerName,
    required this.changeDate,
    this.description,
    required this.status
  });

  factory CompetitionHistoryModel.fromJson(Map<String, dynamic> json){
    int id = json['id'];
    int competitionId = json['competition_id'];
    int? changerId = json['changer_id'];
    String? changerName = json['changer_name'];
    DateTime changeDate = json['change_date'];
    String? description = json['description'];
    CompetitionStatus status = json['status'];

    return CompetitionHistoryModel(id: id, competitionId: competitionId, changeDate: changeDate, status: status);
  }
}