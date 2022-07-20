import '../../models/common/paging_result.dart';
import '../../models/entities/club/club_model.dart';

abstract class IClubService {
  Future<ClubModel?> getClubSelected(int? ClubId);

  Future<PagingResult<ClubModel>> getClubsBelongToUniversity(int currentPage);
}
