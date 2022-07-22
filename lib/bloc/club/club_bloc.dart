import 'package:get_it/get_it.dart';
import '../../models/common/current_user.dart';
import '../../models/entities/club/club_model.dart';
import '../../models/entities/member/member_detail_model.dart';
import '../../services/i_services.dart';
import '../../utils/base_bloc.dart';
import 'club_event.dart';
import 'club_state.dart';

class ClubBloc extends BaseBloc<ClubEvent, ClubState> {
  final IClubService service;

  ClubBloc({required this.service})
      : super(ClubState(ClubSelected: null, MemberSelected: null)) {
    on((event, emit) async {
      if (event is ClubInitEvent) {
        CurrentUser user = GetIt.I.get<CurrentUser>();
        //
        //print('vừa vào trang club nếu có club phải qua trang chọn club cho t');
        //print(user.clubsBelongToStudent!.length.toString());
        //chuyển trang chọn clubs
        if (user.clubsBelongToStudent != null) {
          if (user.clubIdSelected != null) {
            //load info club selected
            ClubModel? clubSelected =
                await service.getClubSelected(user.clubIdSelected);

            //load info member selected
            MemberDetailModel? memberSelected =
                await service.getMemberSelected(user.clubIdSelected);

            //load cuộc thi của club selected
            if (clubSelected == null) {
              listener.add(ShowingSnackBarEvent(
                  message: "Chưa Load được club do User chưa chọn"));
            } else {
              emit(state.copyWith(
                  ClubSelected: clubSelected, MemeberSelected: memberSelected));
            }
          } else {
            listener.add(NavigatorClubSelectionPageEvent());
          }
        }
        // } else {
        //   listener.add(NavigatorClubsViewPageEvent());
        // }
      }
      //
      if (event is ChooseAnotherClubEvent) {
        listener.add(NavigatorClubSelectionPageEvent());
      }
      //
      if (event is ClubSelectionEvent) {
        listener.add(NavigatorClubSelectionPageEvent());
      }
      //
      if (event is ClubsViewEvent) {
        listener.add(NavigatorClubsViewPageEvent());
      }
    });
  }
}
