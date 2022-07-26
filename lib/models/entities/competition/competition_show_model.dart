import '../competition_entity/competition_entity_model.dart';

class CompetitionShowModel {
  int id;
  String name;
  int view;
  int competitionTypeId;
  String competitionTypeName;
  DateTime startTime;
  List<CompetitionEntityModel> competitionEntities;
  

  CompetitionShowModel(
      {required this.id,
      required this.name,
      required this.view,
      required this.competitionTypeId,
      required this.competitionTypeName,
      required this.startTime,
      required this.competitionEntities});

  factory CompetitionShowModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'] ?? 0;
    String name = json['name'] ?? '';
    int view = json['view'] ?? 0;
    int competitionTypeId = json['competition_type_id'] ?? 0;
    String competitionTypeName = json['competition_type_name'] ?? '';
    DateTime startTime = DateTime.parse(json['start_time']);
    List<CompetitionEntityModel> competitionEntities = [];
    json['competition_entities']?.forEach((v) {
      competitionEntities.add(CompetitionEntityModel.fromJson(v));
    });

    return CompetitionShowModel(
        id: id,
        name: name,
        view: view,
        competitionTypeId: competitionTypeId,
        competitionTypeName: competitionTypeName,
        startTime: startTime,
        competitionEntities: competitionEntities);
  }
}
