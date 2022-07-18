import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/common/current_user.dart';
import 'package:unicec_mobi/models/entities/user/user_model.dart';
import 'package:unicec_mobi/services/user_svc/i_user_service.dart';
import 'package:http/http.dart' as http;
import 'package:unicec_mobi/utils/adapter.dart';
import 'package:unicec_mobi/utils/api.dart';
import 'package:unicec_mobi/utils/log.dart';

class UserService implements IUserService{
  Adapter adapter = Adapter();

  @override
  Future<UserModel?> getById(int id) async {
    // TODO: implement getById
    var client = http.Client();
    String url = Api.GetUrl(apiPath: "${Api.users}/$id");
    String token = GetIt.I.get<CurrentUser>().idToken;
    try{
      var response = await client.get(Uri.parse(url), headers: Api.GetHeader(token));
      if(response.statusCode == 200){
        Map<String, dynamic> result = adapter.parseToMap(response);
        return UserModel.fromJson(result);
      }

    }catch(e){
      Log.error(e.toString());
    }

    return null;
  }

}