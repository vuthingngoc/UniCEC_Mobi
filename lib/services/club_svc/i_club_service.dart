import '../../models/common/paging_result.dart';
import '../../models/entities/club/club_model.dart';
import '../../models/entities/member/member_detail_model.dart';

abstract class IClubService {
  Future<ClubModel?> getClubSelected(int? ClubId);

  Future<MemberDetailModel?> getMemberSelected(int? clubId);

  Future<PagingResult<ClubModel>> getClubsBelongToUniversity(int currentPage);

  Future<List<MemberDetailModel>?> getMembersBelongToClubs();
}
