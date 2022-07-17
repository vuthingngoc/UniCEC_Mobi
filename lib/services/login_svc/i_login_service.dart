import '../../models/entities/authenicator_user/authenicator_user_model.dart';
import '../../models/entities/club/club_model.dart';

abstract class ILoginService {
  //get jwt token authentication
  Future<AuthenicatorUserModel?> getTemp(String? idToken);

  //get list club of userId
  Future<List<ClubModel>?> getListClubsBelongToStudent(int? userId);
}
