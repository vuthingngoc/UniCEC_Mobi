import 'dart:convert';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/entities/department/department_model.dart';

import '../../models/common/current_user.dart';
import '../../models/common/paging_result.dart';
import '../../models/entities/user/complete_profile.dart';
import '../../utils/adapter.dart';
import '../../utils/api.dart';
import '../../utils/log.dart';
import 'i_university_selection_service.dart';
import 'package:http/http.dart' as http;

class UniversitySelectionService implements IUniversitySelectionService {
  @override
  Future<bool> completeProfile(CompleteProfile model) async {
    Adapter adapter = Adapter();

    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.usersUpdateWithJWT);

    //get_it lấy IdToken
    String? idToken = GetIt.I.get<CurrentUser>().idToken;
    int? userId = GetIt.I.get<CurrentUser>().id;

    try {
      var response = await client.put(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': "Bearer $idToken"
          },
          //truyền vào body
          body: jsonEncode(<String, dynamic>{
            "id": userId,
            "university_id": model.universityId,
            "department_id": model.departmentId,
            "user_code": model.studentCode,
            "phone": model.phone,
            "gender": model.gender,
            "dob": model.dob,
            "description": model.description
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

  @override
  Future<List<DepartmentModel>?> getDepartmentByUni(int UniversityId) async {
    Adapter adapter = Adapter();

    var client = http.Client();
    String url = Api.GetUrl(apiPath: Api.departments);

    PagingResult<DepartmentModel> pagingResult;

    url += "/search?universityId=" + UniversityId.toString() + "&pageSize=40";

    try {
      //get_it lấy IdToken
      String? idToken = GetIt.I.get<CurrentUser>().idToken;

      var response = await client.get(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $idToken"
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> result = adapter.parseToMap(response);
        pagingResult = PagingResult.fromJson(result, DepartmentModel.fromJson);
        //
        List<DepartmentModel> listDepartment = pagingResult.items;
        return listDepartment;
      }
    } catch (e) {
      Log.error(e.toString());
    } finally {
      client.close();
    }
    return null;
  }
}
