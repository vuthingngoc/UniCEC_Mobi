import 'package:unicec_mobi/models/entities/member/member_model.dart';
import 'package:unicec_mobi/models/enums/member_status.dart';

import '../../models/entities/member/member_detail_model.dart';

abstract class IMemberService {
  Future<MemberModel?> applyInClub(int clubId);
  Future<MemberStatus> getStatusMember(int clubId);
}
