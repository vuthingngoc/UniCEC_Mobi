import '../../models/enums/team_status.dart';
import '/models/entities/team/team_detail_model.dart';
import '../../models/common/paging_result.dart';
import '../../models/entities/team/team_model.dart';
import '../../models/entities/team/team_request_model.dart';

abstract class ITeamService {
  Future<TeamDetailModel?> GetCurrentTeam(int teamId, int competitionId);
  //
  Future<PagingResult<TeamModel>?> GetListTeam(TeamRequestModel request);
  //
  Future<bool> CreateTeam(
      int competitionId, String teamName, String teamDescription);
  //
  Future<bool> UpdateTeam(
      int teamId, String teamName, String teamDescription, TeamStatus status);
  //
  Future<int> JoinTeam(String InvitedCode);
  //
  Future<TeamDetailModel?> GetDetailTeamModel(int competitionId, int teamId);
}
