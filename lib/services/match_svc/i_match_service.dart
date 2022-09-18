import 'package:unicec_mobi/models/common/paging_result.dart';

import '../../models/entities/match/match_model.dart';
import '../../models/entities/match/teams_in_match_model.dart';

abstract class IMatchService{
  Future<PagingResult<MatchModel>?> GetMatchesByRound(int roundId);
  Future<List<TeamsInMatchModel>?> GetTeamsInMatch(int matchId);
  Future<MatchModel?> GetMatchById(int matchId);
}