import 'package:unicec_mobi/bloc/view_detail_match/view_detail_match_event.dart';
import 'package:unicec_mobi/bloc/view_detail_match/view_detail_match_state.dart';
import 'package:unicec_mobi/models/entities/match/match_model.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';

import '../../models/enums/match_status.dart';
import '../../services/match_svc/i_match_service.dart';

class ViewDetailMatchBloc extends BaseBloc<ViewDetailMatchEvent, ViewDetailMatchState>{
  IMatchService service;

  ViewDetailMatchBloc({required this.service}) 
    : super(ViewDetailMatchState(
        match: MatchModel(
          id: 0,
          address: "",
          createTime: DateTime.now(),
          endTime: DateTime.now(),
          description: "",
          matchTypeId: 0,
          matchTypeName: "",
          numberOfTeam: 0,
          roundId: 0,
          roundName: "",
          startTime: DateTime.now(),
          status: MatchStatus.Ready,
          title: ""
        ))){
          (on((event, emit) async {
            
          }));
        }

}