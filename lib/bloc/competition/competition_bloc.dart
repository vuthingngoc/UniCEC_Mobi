import 'package:unicec_mobi/bloc/competition/competition_event.dart';
import 'package:unicec_mobi/bloc/competition/competition_state.dart';
import 'package:unicec_mobi/models/common/paging_result.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_request_model.dart';
import 'package:unicec_mobi/models/enums/competition_scope_status.dart';
import 'package:unicec_mobi/models/enums/competition_status.dart';
import 'package:unicec_mobi/services/i_services.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';
import 'package:unicec_mobi/utils/log.dart';

// import '../../models/entities/competition/competition_in_majors_model.dart';

class CompetitionBloc extends BaseBloc<CompetitionEvent, CompetitionState> {
  final ICompetitionService service;

  CompetitionBloc({required this.service})
      : super(CompetitionState(
            competitions: <CompetitionModel>[],
            outStandingCompetitions: <CompetitionModel>[])) {
    on((event, emit) async {
      if (event is LoadOutStandingCompetitionEvent) {
        print('LoadOutStandingCompetitionEvent is running ...');
        List<int> statuses = [];
        statuses.add(CompetitionStatus.Publish.index);
        CompetitionRequestModel request = CompetitionRequestModel(
            viewMost: true, statuses: statuses); // add more params if you want
        PagingResult<CompetitionModel>? result =
            await service.loadCompetition(request);
        return (result != null)
            ? result
            : Log.error("Competition model is null");
      }

      if (event is LoadCompetitionEvent) {
        print('LoadCompetitionEvent is running ...');
        List<int> statuses = [];
        statuses.add(CompetitionStatus.Publish.index);
        CompetitionRequestModel request = CompetitionRequestModel(
            statuses: statuses); // add more params if you want
        PagingResult<CompetitionModel>? result =
            await service.loadCompetition(request);
        return (result != null)
            ? result
            : Log.error("Competition model is null");
      }
    });
  }
}
