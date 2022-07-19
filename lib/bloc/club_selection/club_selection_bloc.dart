import 'package:get_it/get_it.dart';

import '../../models/common/current_user.dart';
import '../../utils/base_bloc.dart';
import 'club_selection_event.dart';
import 'club_selection_state.dart';

class ClubSelectionBloc
    extends BaseBloc<ClubSelectionEvent, ClubSelectionState> {
  ClubSelectionBloc()
      : super(ClubSelectionState(listClubsBelongToStudent: [])) {
    on((event, emit) async {
      if (event is ClubSelectionEvent) {
        CurrentUser user = GetIt.I.get<CurrentUser>();
        emit(state.copyWith(
            listClubsBelongToStudent: user.clubsBelongToStudent!));
      }
      if (event is ChooseClubSelectionEvent) {
        CurrentUser user = GetIt.I.get<CurrentUser>();
        user.clubIdSelected = event.clubIdSelected;
        listener.add(NavigatorClubPageEvent());
      }
    });
  }
}
