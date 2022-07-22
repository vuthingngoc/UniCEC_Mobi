import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/common/paging_result.dart';
import 'package:unicec_mobi/models/entities/club/club_model.dart';
import 'package:http/http.dart' as http;
import 'package:unicec_mobi/models/entities/member/member_detail_model.dart';
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

  @override
  Future<PagingResult<ClubModel>> getClubsBelongToUniversity(
      int currentPage) async {
    String? idToken = GetIt.I.get<CurrentUser>().idToken;
    int? universityId = GetIt.I.get<CurrentUser>().universityId;

    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.clubs);

    url += "/search";
    url += "?universityId=" + universityId.toString();
    url += "&status=true";
    url += "&currentPage=" + currentPage.toString();
    url += "&pageSize=3";

    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(idToken));
      if (response.statusCode == 200) {
        Map<String, dynamic> result = adapter.parseToMap(response);
        PagingResult<ClubModel> pagingResult =
            PagingResult.fromJson(result, ClubModel.fromJson);

        return pagingResult;
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return PagingResult(
        currentPage: 0,
        totalPages: 0,
        pageSize: 0,
        totalCount: 0,
        hasNext: false,
        hasPrevious: false,
        items: []);
  }

  @override
  Future<MemberDetailModel?> getMemberSelected(int? clubId) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.members);
    url += "/info?clubId=" + clubId.toString();
    String? idToken = GetIt.I.get<CurrentUser>().idToken;
    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(idToken));

      if (response.statusCode == 400) {
        Log.error(response.body.toString());
      }
      if (response.statusCode == 200) {
        List<dynamic> result = adapter.parseToList(response);

        if (result.isEmpty) {
          return null;
        }

        //
        List<MemberDetailModel> membersBelongToClubs = [];
        //
        for (var element in result) {
          MemberDetailModel model = MemberDetailModel.fromJson(element);
          membersBelongToClubs.add(model);
        }

        return membersBelongToClubs[0];
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return null;
  }

  @override
  Future<List<MemberDetailModel>?> getMembersBelongToClubs() async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.members);
    url += "/info";
    String? idToken = GetIt.I.get<CurrentUser>().idToken;
    try {
      var response =
          await client.get(Uri.parse(url), headers: Api.GetHeader(idToken));

      if (response.statusCode == 400) {
        Log.error(response.body.toString());
      }
      if (response.statusCode == 200) {
        List<dynamic> result = adapter.parseToList(response);

        if (result.isEmpty) {
          return null;
        }

        //
        List<MemberDetailModel> membersBelongToClubs = [];
        //
        for (var element in result) {
          MemberDetailModel model = MemberDetailModel.fromJson(element);
          membersBelongToClubs.add(model);
        }

        return membersBelongToClubs;
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return null;
  }
}
