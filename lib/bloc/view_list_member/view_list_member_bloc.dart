import 'package:get_it/get_it.dart';

import '../../models/common/current_user.dart';
import '../../models/entities/member/member_model.dart';
import '../../services/member_svc/i_member_service.dart';
import '../../utils/base_bloc.dart';
import 'view_list_member_event.dart';
import 'view_list_member_state.dart';

class ViewListMemberBloc
    extends BaseBloc<ViewListMemberEvent, ViewListMemberState> {
  IMemberService service;

  ViewListMemberBloc({required this.service})
      : super(ViewListMemberState(listMember: null)) {
    (on((event, emit) async {
      if (event is LoadListMemberEvent) {
        int clubIdSelected = GetIt.I.get<CurrentUser>().clubIdSelected;
        List<MemberModel>? result =
            await service.getListMemberByClubId(clubIdSelected);
        if (result != null) {
          emit(state.copyWith(newListMember: result));
        }
      }
    }));
  }
}
