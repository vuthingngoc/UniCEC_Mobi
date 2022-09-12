import 'package:unicec_mobi/bloc/view_list_match/view_list_match_event.dart';
import 'package:unicec_mobi/bloc/view_list_match/view_list_match_state.dart';

import '../../services/match_svc/i_match_service.dart';
import '../../utils/base_bloc.dart';

class ViewListMatchBloc extends BaseBloc<ViewListMatchEvent, ViewListMatchState>{
  IMatchService service;

  ViewListMatchBloc({required this.service}) 
    : super(ViewListMatchState(
      matches: []
    )){
      (on((event, state) async {
        
      }));
    }

}