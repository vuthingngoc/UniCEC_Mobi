import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:unicec_mobi/models/entities/club/club_model.dart';

import '../../models/common/current_user.dart';
import '../../models/entities/authenicator_user/authenicator_user_model.dart';
import '../../utils/adapter.dart';
import '../../utils/api.dart';
import '../../utils/log.dart';
import 'i_login_service.dart';

class LoginService implements ILoginService {
  Adapter adapter = Adapter();

  @override
  Future<AuthenicatorUserModel?> getTemp(String? idToken) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.authentication);
    try {
      var response =
          await client.post(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $idToken"
      });

      if (response.statusCode == 400) {
        Log.error(response.body.toString());
      }
      if (response.statusCode == 200) {
        //
        Map<String, dynamic> result = adapter.parseToMap(response);
        //
        AuthenicatorUserModel userInfo = AuthenicatorUserModel.fromJson(result);

        return userInfo;
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return null;
  }

  @override
  Future<List<ClubModel>?> getListClubsBelongToStudent(int? userId) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.clubsBelongToStudent);

    url += "/" + userId.toString();

    String? idToken = GetIt.I.get<CurrentUser>().idToken;
    try {
      var response = await client.get(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $idToken"
      });

      if (response.statusCode == 200) {
        //
        List<dynamic> resultList = adapter.parseToList(response);

        if (resultList.isEmpty) {
          return null;
        }
        //
        List<ClubModel> clubsBelongToStudent = [];
        //
        for (var element in resultList) {
          ClubModel model = ClubModel.fromJson(element);
          clubsBelongToStudent.add(model);
        }

        return clubsBelongToStudent;
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return null;
  }
}
