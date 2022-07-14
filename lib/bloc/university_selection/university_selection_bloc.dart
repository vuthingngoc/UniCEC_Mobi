import 'package:unicec_mobi/bloc/university_selection/university_selection_event.dart';
import 'package:unicec_mobi/bloc/university_selection/university_selection_state.dart';
import 'package:unicec_mobi/services/i_services.dart';

import '../../utils/base_bloc.dart';

class UniversitySelectionBloc
    extends BaseBloc<UniversitySelectionEvent, UniversitySelectionState> {
  final IUniversitySelectionService service;

  UniversitySelectionBloc(this.service)
      : super(UniversitySelectionState(listUniBelongToEmail: [])) {
    on((event, emit) async {
      //Recieve data
      if (event is RecieveData) {
        // TODO: implement
        //set state emit ra ngoài
        emit(state.copyWith(listUniBelongToEmail: event.listUniBelongToEmail));
      }

      //Select University
      if (event is SelectUniversity) {
        bool check = await service.selectionUniversity(event.uniSelection.id);
        if (check) {
          listener.add(NavigatorWelcomePageEvent());
        } else {
          listener.add(ShowingSnackBarEvent(message: "Lỗi Chọn Trường"));
        }
      }
    });
  }
}
