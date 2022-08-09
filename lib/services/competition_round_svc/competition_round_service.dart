import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/common/current_user.dart';
import 'package:unicec_mobi/models/entities/competition_round/competition_round_model.dart';
import 'package:unicec_mobi/models/entities/team/team_model.dart';
import 'package:http/http.dart' as http;
import 'package:unicec_mobi/utils/log.dart';

import '../../models/common/paging_result.dart';
import '../../utils/adapter.dart';
import '../../utils/api.dart';
import 'i_competition_round_service.dart';

class CompetitionRoundService implements ICompetitionRoundService {
  Adapter adapter = Adapter();

  @override
  Future<TeamModel> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<TeamModel> getListCompetitionRoundByConditions() {
    // TODO: implement getListCompetitionRoundByConditions
    throw UnimplementedError();
  }

  @override
  Future<PagingResult<CompetitionRoundModel>?> loadRoundsByCompetition(
      int competitionId) async {
    var client = http.Client();
    String params = '?competitionId=$competitionId';
    String url = Api.GetUrl(apiPath: '${Api.competitionRounds}/search$params');
    String token = GetIt.I.get<CurrentUser>().idToken;
    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        Map<String, dynamic> json = adapter.parseToMap(response);
        return PagingResult.fromJson(json, CompetitionRoundModel.fromJson);
      }
    } catch (error) {
      Log.error(error.toString());
    }

    return null;
  }
}
