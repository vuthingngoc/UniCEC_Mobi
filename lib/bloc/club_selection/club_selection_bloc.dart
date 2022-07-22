import 'package:get_it/get_it.dart';

import '../../models/common/current_user.dart';
import '../../models/entities/member/member_detail_model.dart';
import '../../services/login_svc/i_login_service.dart';
import '../../utils/base_bloc.dart';
import 'club_selection_event.dart';
import 'club_selection_state.dart';

class ClubSelectionBloc
    extends BaseBloc<ClubSelectionEvent, ClubSelectionState> {
  ILoginService service; //-> mượn hàm của login
  ClubSelectionBloc({required this.service})
      : super(ClubSelectionState(
            listClubsBelongToStudent: [], listMembersBelongToClubs: [])) {
    on((event, emit) async {
      if (event is ClubSelectionEvent) {
        CurrentUser user = GetIt.I.get<CurrentUser>();
        emit(state.copyWith(
            listClubsBelongToStudent: user.clubsBelongToStudent,
            listMembersBelongToClubs: user.membersBelongToClubs));
      }
      if (event is ChooseClubSelectionEvent) {
        CurrentUser user = GetIt.I.get<CurrentUser>();
        user.clubIdSelected = event.clubIdSelected;
        listener.add(NavigatorClubPageEvent());
      }
      if (event is ClubsViewPageEvent) {
        listener.add(NavigatorClubsViewPageEvent());
      }
      //hàm refresh cho nên add lại hết state global
      if (event is RefreshEvent) {
        //
        CurrentUser user = GetIt.I.get<CurrentUser>();
        user.clubsBelongToStudent =
            await service.getListClubsBelongToStudent(user.id);
        //
        //load list member belong to club -> active
        if (user.clubsBelongToStudent != null) {
          user.membersBelongToClubs = [];
          for (var club in user.clubsBelongToStudent) {
            MemberDetailModel? member =
                await service.getMemberBelongToClub(club.id);

            user.membersBelongToClubs.add(member);
          }
        }
        emit(state.copyWith(
            listClubsBelongToStudent: user.clubsBelongToStudent,
            listMembersBelongToClubs: user.membersBelongToClubs));
      }
    });
  }
}
