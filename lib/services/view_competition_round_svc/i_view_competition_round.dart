

import '../../models/entities/team/team_model.dart';

abstract class IViewCompetitionRoundService{
  Future<TeamModel> getListCompetitionRoundByConditions();
  Future<TeamModel> getById(int id);
}