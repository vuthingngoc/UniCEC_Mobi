import '../../models/entities/club/club_model.dart';
import '../../models/entities/uni_selector/uni_selector_model.dart';

abstract class ILoginService {
  //get jwt token authentication
  Future<UniSelectorModel?> getUniSelector(String? idToken);

  //get list club of userId
  Future<List<ClubModel>?> getListClubsBelongToStudent(int? userId);
}
