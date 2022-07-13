import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/adapter.dart';
import '../../utils/api.dart';
import '../../utils/log.dart';
import 'i_login_service.dart';

class LoginService implements ILoginService {
  Adapter adapter = Adapter();

  @override
  Future<String?> getJWTToken(String? idToken) async {
    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.authentication);
    try {
      var response = await client.post(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: "Bearer $idToken"});
      if (response.statusCode == 200) {
        String result = adapter.parseToString(response);
        return result;
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return null;
  }
}
