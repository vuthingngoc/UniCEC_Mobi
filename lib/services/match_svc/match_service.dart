import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/common/current_user.dart';
import 'package:unicec_mobi/models/entities/match/match_model.dart';
import 'package:unicec_mobi/models/common/paging_result.dart';
import 'package:unicec_mobi/services/match_svc/i_match_service.dart';
import 'package:http/http.dart' as http;
import 'package:unicec_mobi/utils/adapter.dart';
import 'package:unicec_mobi/utils/api.dart';
import 'package:unicec_mobi/utils/log.dart';

class MatchService implements IMatchService{
  Adapter adapter = Adapter();
  
  @override
  Future<PagingResult<MatchModel>?> GetMatchesByRound(int roundId) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: "${Api.matches}/search?roundId=$roundId");
    String token = GetIt.I.get<CurrentUser>().idToken;

    try{
      var response = await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if(response.statusCode == 200){
        String isList = "[]";
        if(response.body.toString().compareTo(isList) == 0){
          return null;
        }
        //
        Map<String, dynamic> json = adapter.parseToMap(response);
        return PagingResult.fromJson(json, MatchModel.fromJson);        
      }

    }catch(e){
      Log.error(e.toString());
    }

    return null;
  }
  
}