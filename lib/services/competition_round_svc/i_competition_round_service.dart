

import 'package:unicec_mobi/models/common/paging_result.dart';

import '../../models/entities/competition_round/competition_round_model.dart';
import '../../models/entities/team/team_model.dart';

abstract class ICompetitionRoundService{
  Future<TeamModel> getListCompetitionRoundByConditions();
  Future<TeamModel> getById(int id);
  Future<PagingResult<CompetitionRoundModel>?> loadRoundsByCompetition(int competitionId);
}