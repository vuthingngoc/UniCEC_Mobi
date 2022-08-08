import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/entities/competition/competition_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';
import 'package:unicec_mobi/utils/adapter.dart';

import '../../models/common/current_user.dart';
import '../../utils/api.dart';
import '../../utils/log.dart';
import 'i_competition_detail_service.dart';

class CompetitionDetailService implements ICompetitionDetailService {
  Adapter adapter = Adapter();

  @override
  Future<CompetitionDetailModel?> getById(int id) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: '${Api.competitions}/$id');
    String token = GetIt.I.get<CurrentUser>().idToken;
    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = adapter.parseToMap(response);
        return CompetitionDetailModel.fromJson(json);
      }
    } catch (e) {
      Log.error(e.toString());
    }

    return null;
  }

  @override
  Future<CompetitionDetailModel> getDetailCompetitionByConditions() {
    // TODO: implement getDetailCompetitionByConditions
    throw UnimplementedError();
  }

  @override
  Future<CompetitionModel?> getCompetitionStudentJoin(int competitionId) async {
    var client = http.Client();
    String url = Api.GetUrl(
        apiPath:
            '${Api.competitions}/student-join-competition?competitionId=$competitionId');
    String token = GetIt.I.get<CurrentUser>().idToken;
    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = adapter.parseToMap(response);
        return CompetitionModel.fromJson(json);
      }
    } catch (e) {
      Log.error(e.toString());
    }
    return null;
  }
}
