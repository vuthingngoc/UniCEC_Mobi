import 'package:get_it/get_it.dart';
import '../../models/common/current_user.dart';
import '../../services/i_services.dart';
import '../../utils/base_bloc.dart';
import 'club_event.dart';
import 'club_state.dart';

class ClubBloc extends BaseBloc<ClubEvent, ClubState> {
  final IClubService service;

  ClubBloc({required this.service}) : super(ClubState()) {
    on((event, emit) async {
      if (event is ClubEvent) {
        CurrentUser user = GetIt.I.get<CurrentUser>();
        //print(user.clubsBelongToStudent!.length.toString());
        //chuyển trang chọn clubs
        if (user.clubsBelongToStudent != null) {
          listener.add(NavigatorClubSelectionPage());
        }
        //
      }
    });
  }
}
