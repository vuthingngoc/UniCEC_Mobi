import 'dart:convert';

import 'package:get_it/get_it.dart';
import '/models/entities/team/team_request_model.dart';
import '/models/entities/team/team_model.dart';
import '/services/team_svc/i_team_service.dart';
import '/utils/adapter.dart';

import 'package:http/http.dart' as http;
import '/utils/api.dart';
import '/utils/log.dart';

import '../../models/common/current_user.dart';
import '../../models/common/paging_result.dart';
import '../../models/entities/team/team_detail_model.dart';

class TeamService extends ITeamService {
  Adapter adapter = Adapter();

  @override
  Future<TeamDetailModel?> GetCurrentTeam(int teamId, int competitionId) async {
    var client = http.Client();
    String params = '?teamId=$teamId&competitionId=$competitionId';
    String url = Api.GetUrl(apiPath: '${Api.teams}/detail$params');
    String token = GetIt.I.get<CurrentUser>().idToken;

    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = adapter.parseToMap(response);
        return TeamDetailModel.fromJson(json);
      }
    } catch (e) {
      Log.error(e.toString());
    }

    return null;
  }

  @override
  Future<PagingResult<TeamModel>?> GetListTeam(TeamRequestModel request) async {
    var client = http.Client();
    String params = '?';

    //competitionId
    if (request.competitionId != null) {
      params += '&competitionId=${request.competitionId}';
    }

    //currentPage
    if (request.currentPage != null) {
      params += '&currentPage${request.currentPage}';
    }

    String url = Api.GetUrl(apiPath: '${Api.teams}/all$params');
    String? token = GetIt.I.get<CurrentUser>().idToken;

    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if (response.statusCode == 200) {
        String isList = "[]";
        if (response.body.toString().compareTo(isList) == 0) {
          //TH1
          return null;
        } else {
          //TH2
          Map<String, dynamic> json = adapter.parseToMap(response);
          return PagingResult.fromJson(json, TeamModel.fromJson);
        }
      }
    } catch (e) {
      Log.error(e.toString());
    }
    return null;
  }

  @override
  Future<bool> CreateTeam(
      int competitionId, String teamName, String teamDescription) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: '${Api.teams}');
    String? token = GetIt.I.get<CurrentUser>().idToken;
    try {
      var response = await client.post(Uri.parse(url),
          headers: Api.GetHeader(token),
          body: jsonEncode(<String, dynamic>{
            "competition_id": competitionId,
            "name": teamName,
            "description": teamDescription
          }));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      Log.error(e.toString());
    }
    return false;
  }

  @override
  Future<int> JoinTeam(String InvitedCode) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: '${Api.teams}/add-participant');
    String? token = GetIt.I.get<CurrentUser>().idToken;
    try {
      var response = await client.post(Uri.parse(url),
          headers: Api.GetHeader(token),
          body: jsonEncode(<String, dynamic>{"invited_code": InvitedCode}));
      if (response.statusCode == 200) {
        Map<String, dynamic> result = adapter.parseToMap(response);
        TeamModel team = TeamModel.fromJson(result);
        return team.id;
      }
    } catch (e) {
      Log.error(e.toString());
    }
    return -1;
  }
}
