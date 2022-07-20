import 'package:unicec_mobi/models/entities/team/team_detail_model.dart';

import '../../models/entities/team/team_model.dart';

abstract class ITeamService{
  Future<TeamDetailModel?> GetCurrentTeam(int teamId, int competitionId);
}