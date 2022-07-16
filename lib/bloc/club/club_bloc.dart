import '../../services/i_services.dart';
import '../../utils/base_bloc.dart';
import 'club_event.dart';
import 'club_state.dart';

class ClubBloc extends BaseBloc<ClubEvent, ClubState> {
  final IClubService service;

  ClubBloc(this.service) : super(ClubState(listClubModel: [])) {
    on((event, emit) async {});
  }
}
