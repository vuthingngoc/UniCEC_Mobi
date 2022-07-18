import 'package:get_it/get_it.dart';
import '../../models/common/current_user.dart';
import '../../models/entities/club/club_model.dart';
import '../../services/i_services.dart';
import '../../utils/base_bloc.dart';
import 'club_event.dart';
import 'club_state.dart';

class ClubBloc extends BaseBloc<ClubEvent, ClubState> {
  final IClubService service;

  ClubBloc({required this.service}) : super(ClubState(ClubSelected: null)) {
    on((event, emit) async {
      if (event is ClubEvent) {
        CurrentUser user = GetIt.I.get<CurrentUser>();
        //print(user.clubsBelongToStudent!.length.toString());
        //chuyển trang chọn clubs
        if (user.clubsBelongToStudent != null) {
          if (user.clubIdSelected != 0) {
            //load info club selected
            ClubModel? result =
                await service.getClubSelected(user.clubIdSelected);
            //load cuộc thi của club selected
            if (result == null) {
              listener.add(
                  ShowingSnackBarEvent(message: "Load Club Selected Failed"));
            } else {
              emit(state.copyWith(ClubSelected: result));
            }
          } else {
            listener.add(NavigatorClubSelectionPage());
          }
        }
        //
      }
    });
  }
}
