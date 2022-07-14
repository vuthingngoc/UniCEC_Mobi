import 'dart:convert';
import 'dart:io';

import 'package:get_it/get_it.dart';

import '../../models/common/current_user.dart';
import '../../utils/adapter.dart';
import '../../utils/api.dart';
import '../../utils/log.dart';
import 'i_university_selection_svc.dart';
import 'package:http/http.dart' as http;

class UniversitySelectionService implements IUniversitySelectionService {
  @override
  Future<bool> selectionUniversity(int universityId) async {
    Adapter adapter = Adapter();

    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.usersUpdateWithJWT);

    //get_it lấy IdToken
    String? idToken = GetIt.I.get<CurrentUser>().idToken;
    int? userId = GetIt.I.get<CurrentUser>().id;

    try {
      var response = await client.post(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: "Bearer $idToken"},
          //truyền vào body
          body: jsonEncode(<String, dynamic>{
            "id": userId,
            "university_id": universityId,
          }));
      // if (response.statusCode == 400) {
      // }
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return false;
  }
}
