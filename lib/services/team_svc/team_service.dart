import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/services/team_svc/i_team_service.dart';
import 'package:unicec_mobi/utils/adapter.dart';

import 'package:http/http.dart' as http;
import 'package:unicec_mobi/utils/api.dart';
import 'package:unicec_mobi/utils/log.dart';

import '../../models/common/current_user.dart';
import '../../models/entities/team/team_detail_model.dart';

class TeamService extends ITeamService {
  Adapter adapter = Adapter();
  
  @override
  Future<TeamDetailModel?> GetCurrentTeam(int teamId, int competitionId) async {
    // TODO: implement GetCurrentTeam
    var client = http.Client();
    String params = '?teamId=$teamId&competitionId=$competitionId';
    String url = Api.GetUrl(apiPath: '${Api.teams}/detail$params');
    String token = GetIt.I.get<CurrentUser>().idToken;

    try{
      var response = await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if(response.statusCode == 200){
        Map<String, dynamic> json = adapter.parseToMap(response);
        return TeamDetailModel.fromJson(json);
      }

    }catch(e){
      Log.error(e.toString());
    }

    return null;
  }
}
