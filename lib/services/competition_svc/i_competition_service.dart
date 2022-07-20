import 'package:unicec_mobi/models/entities/competition/competition_request_model.dart';

import '../../models/entities/competition/competition_model.dart';
import '../../models/entities/team/team_model.dart';

abstract class ICompetitionService{
  Future<CompetitionModel?> loadCompetition(CompetitionRequestModel request);
  Future<TeamModel?> LoadTeamsInCompetitions(int competitionId);
}