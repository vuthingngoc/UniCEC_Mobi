import 'package:unicec_mobi/models/common/paging_result.dart';
import 'package:unicec_mobi/models/entities/competition/competition_request_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_show_model.dart';

import '../../models/entities/competition/competition_model.dart';
import '../../models/entities/team/team_model.dart';

abstract class ICompetitionService{
  Future<PagingResult<CompetitionModel>?> loadCompetition(CompetitionRequestModel request);
  Future<PagingResult<CompetitionShowModel>?> showCompetition(CompetitionRequestModel request);
  Future<TeamModel?> LoadTeamsInCompetitions(int competitionId);
}