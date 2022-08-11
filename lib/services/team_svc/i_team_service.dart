import '../../models/common/resultCRUD.dart';
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
  Future<ResultCRUD> CreateTeam(
      int competitionId, String teamName, String teamDescription);
  //
  Future<ResultCRUD> UpdateTeam(
      int teamId, String teamName, String teamDescription, TeamStatus status);
  //
  Future<ResultCRUD> UpdateRoleToLeader(int participanInTeamId);
  //
  Future<ResultCRUD> JoinTeam(String invitedCode);
  //
  Future<TeamDetailModel?> GetDetailTeamModel(int competitionId, int teamId);
  //
  Future<bool> MemberOutTeam(int teamId);
  //
  Future<bool> DeleteTeam(int teamId);
  //
  Future<bool> DeleteMemberByTeamLeader(int teamId, int participantId);
}
