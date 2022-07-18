import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/entities/club/club_model.dart';
import 'package:http/http.dart' as http;
import '../../models/common/current_user.dart';
import '../../utils/adapter.dart';
import '../../utils/api.dart';
import '../../utils/log.dart';
import 'i_club_service.dart';

class ClubService implements IClubService {
  Adapter adapter = Adapter();

  @override
  Future<ClubModel?> getClubSelected(int? ClubId) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.clubs);
    url += "/" + ClubId.toString();
    //get_it lấy IdToken
    String? idToken = GetIt.I.get<CurrentUser>().idToken;
    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(idToken));
      if (response.statusCode == 200) {
        Map<String, dynamic> result = adapter.parseToMap(response);
        ClubModel club = ClubModel.fromJson(result);
        return club;
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return null;
  }
}
