import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:unicec_mobi/models/entities/temp/temp.dart';
import '../../utils/adapter.dart';
import '../../utils/api.dart';
import '../../utils/log.dart';
import 'i_login_service.dart';

class LoginService implements ILoginService {
  Adapter adapter = Adapter();

  @override
  Future<Temp?> getTemp(String? idToken) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.authentication);
    try {
      var response =
          await client.post(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $idToken"
      });
      //headers: {HttpHeaders.authorizationHeader: "Bearer $idToken"});
      if (response.statusCode == 400) {
        Log.error(response.body.toString());
      }
      if (response.statusCode == 200) {
        //
        Map<String, dynamic> result = adapter.parseToMap(response);
        //
        Temp userInfo = Temp.fromJson(result);

        return userInfo;
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return null;
  }
}
