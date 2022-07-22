import 'package:unicec_mobi/bloc/club_view_detail/club_view_detail_event.dart';
import 'package:unicec_mobi/bloc/club_view_detail/club_view_detail_state.dart';
import 'package:unicec_mobi/models/enums/member_status.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';

import '../../models/entities/member/member_detail_model.dart';
import '../../models/entities/member/member_model.dart';
import '../../services/i_services.dart';

class ClubViewDetailBloc
    extends BaseBloc<ClubViewDetailEvent, ClubViewDetailState> {
  final IMemberService service;
  ClubViewDetailBloc({required this.service})
      : super(ClubViewDetailState(
            clubViewDetail: null, statusMember: MemberStatus.Student)) {
    on((event, emit) async {
      if (event is RecieveDataEvent) {
        emit(state.copyWith(
            clubViewDetail: event.clubView,
            statusMember: event.clubView.isMemberStatus));
      }
      //
      if (event is ApplyInClubEvent) {
        MemberModel? result = await service.applyInClub(event.clubId);
        if (result != null) {
          emit(state.copyWith(
              clubViewDetail: state.clubViewDetail ?? null,
              statusMember: result.status));
        }
      }
    });
  }
}
