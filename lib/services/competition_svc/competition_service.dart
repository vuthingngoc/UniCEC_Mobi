import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/common/current_user.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_request_model.dart';
import 'package:unicec_mobi/services/competition_svc/i_competition_service.dart';

import 'package:http/http.dart' as http;
import 'package:unicec_mobi/utils/log.dart';
import '../../utils/adapter.dart';
import '../../utils/api.dart';

class CompetitionService implements ICompetitionService{
  Adapter adapter = Adapter();

  @override
  Future<CompetitionModel?> loadCompetition(CompetitionRequestModel request) async {
    var client = http.Client();    
    String params = '?';
    if(request.clubId != null){
      params += 'clubId=${request.clubId}';
    }

    if(request.scope != null){
      params += '&scope=${request.scope}';
    }

    if(request.name != null){
      params += '&name=${request.name}';
    }

    if(request.statuses != null){
      request.statuses?.forEach((element) {
        params += '&statuses=$element';
      });
    }

    String url = Api.GetUrl(apiPath: '${Api.competitions}$params');
    String? token = GetIt.I.get<CurrentUser>().idToken;
    try{
      var response = await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if(response.statusCode == 200){
        Map<String, dynamic> json = adapter.parseToMap(response);
        return CompetitionModel.fromJson(json);
      }

    }catch(e){
      Log.error(e.toString());
    }

    return null;
  }
  
}