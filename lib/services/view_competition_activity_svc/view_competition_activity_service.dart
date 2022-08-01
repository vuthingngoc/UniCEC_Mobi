import 'package:get_it/get_it.dart';
import '../../models/common/current_user.dart';
import '../../models/common/paging_result.dart';
import '../../utils/api.dart';
import '../../utils/log.dart';
import '/models/entities/competition_activity/competition_activity_request_model.dart';
import '/models/entities/competition_activity/competition_activity_model.dart';
import '../../utils/adapter.dart';
import 'i_view_competition_activity_service.dart';
import 'package:http/http.dart' as http;

class CompetitionActivityService implements ICompetitionActivityService {
  Adapter adapter = Adapter();

  @override
  Future<PagingResult<CompetitionActivityModel>?> getListCompetititonActivity(
      CompetitionActivityRequestModel request) async {
    var client = http.Client();
    String params = '?';

    //competitionId
    if (request.competitionId != null) {
      params += '&competitionId=${request.competitionId}';
    }

    //priority status
    if (request.priority != null) {
      params += '&priorityStatus=${request.competitionId}';
    }

    //statuses
    if (request.statuses != null) {
      request.statuses?.forEach((element) {
        params += '&statuses=$element';
      });
    }

    //currentPage
    if (request.currentPage != null) {
      params += '&currentPage${request.currentPage}';
    }

    String url = Api.GetUrl(
        apiPath: '${Api.competitionActivities}/student-is-assigned$params');
    String? token = GetIt.I.get<CurrentUser>().idToken;

    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if (response.statusCode == 200) {
        String isList = "[]";
        if (response.body.toString().compareTo(isList) == 0) {
          //TH1
          List<dynamic> list = adapter.parseToList(response);
          return null;
        } else {
          //TH2
          Map<String, dynamic> json = adapter.parseToMap(response);
          return PagingResult.fromJson(json, CompetitionActivityModel.fromJson);
        }
      }
    } catch (e) {
      Log.error(e.toString());
    }
    return null;
  }
}
