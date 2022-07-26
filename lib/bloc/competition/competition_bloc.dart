import 'package:unicec_mobi/bloc/competition/competition_event.dart';
import 'package:unicec_mobi/bloc/competition/competition_state.dart';
import 'package:unicec_mobi/models/common/paging_result.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_request_model.dart';
import 'package:unicec_mobi/models/enums/competition_status.dart';
import 'package:unicec_mobi/services/i_services.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';
import 'package:unicec_mobi/utils/log.dart';

import '../../models/common/paging_result.dart';
import '../../models/entities/competition/competition_show_model.dart';

// import '../../models/entities/competition/competition_in_majors_model.dart';

class CompetitionBloc extends BaseBloc<CompetitionEvent, CompetitionState> {
  final ICompetitionService service;

  CompetitionBloc({required this.service})
      : super(CompetitionState(
            competitions: <CompetitionShowModel>[],
            outStandingCompetitions: <CompetitionShowModel>[])) {
    on((event, emit) async {
      if (event is LoadOutStandingCompetitionEvent) {
        print('LoadOutStandingCompetitionEvent is running ...');
        List<int> statuses = [];
        statuses.add(CompetitionStatus.Publish.index);
        statuses.add(CompetitionStatus.Approve.index); // maybe will delete later
        CompetitionRequestModel request = CompetitionRequestModel(
            viewMost: true, statuses: statuses); // add more params if you want
        PagingResult<CompetitionShowModel>? result =
            await service.showCompetition(request);
        emit(state.copyWith(outStandingCompetitions: result?.items));    
      }

      if (event is LoadCompetitionEvent) {
        print('LoadCompetitionEvent is running ...');
        List<int> statuses = [];
        statuses.add(CompetitionStatus.Publish.index);
        statuses.add(CompetitionStatus.Approve.index); // maybe will delete later
        CompetitionRequestModel request = CompetitionRequestModel(
            statuses: statuses); // add more params if you want
        PagingResult<CompetitionShowModel>? result =
            await service.showCompetition(request);
        emit(state.copyWith(competitions: result?.items));
      }
    });
  }
}
