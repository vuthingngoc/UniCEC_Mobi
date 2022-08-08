import 'package:unicec_mobi/bloc/competition/competition_event.dart';
import 'package:unicec_mobi/bloc/competition/competition_state.dart';
import 'package:unicec_mobi/models/common/paging_result.dart';
import 'package:unicec_mobi/models/entities/competition/competition_detail_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_request_model.dart';
import 'package:unicec_mobi/models/enums/competition_status.dart';
import 'package:unicec_mobi/services/i_services.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';

import '../../models/common/paging_result.dart';
import '../../models/entities/competition/competition_show_model.dart';

// import '../../models/entities/competition/competition_in_majors_model.dart';

class CompetitionBloc extends BaseBloc<CompetitionEvent, CompetitionState> {
  final ICompetitionService service;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  CompetitionBloc({required this.service})
      : super(CompetitionState(
            competitions: <CompetitionShowModel>[],
            outStandingCompetitions: <CompetitionShowModel>[])) {
    on((event, emit) async {
      if (event is LoadOutStandingCompetitionEvent) {
        print('LoadOutStandingCompetitionEvent is running ...');
        _isLoading = true;
        List<int> statuses = [];
        statuses.add(CompetitionStatus.Publish.index);
        statuses
            .add(CompetitionStatus.Approve.index); // maybe will delete later
        //
        statuses
            .add(CompetitionStatus.OnGoing.index); // maybe will delete later
        CompetitionRequestModel request = CompetitionRequestModel(
            viewMost: true, statuses: statuses); // add more params if you want
        PagingResult<CompetitionShowModel>? result =
            await service.showCompetition(request);
        emit(state.copyWith(outStandingCompetitions: result?.items));
        _isLoading = false;
      }

      if (event is LoadCompetitionEvent) {
        print('LoadCompetitionEvent is running ...');
        _isLoading = true;
        List<int> statuses = [];
        statuses.add(CompetitionStatus.Publish.index);
        statuses
            .add(CompetitionStatus.Approve.index); // maybe will delete later
        //
        statuses
            .add(CompetitionStatus.OnGoing.index); // maybe will delete later
        CompetitionRequestModel request = CompetitionRequestModel(
            statuses: statuses); // add more params if you want
        PagingResult<CompetitionShowModel>? result =
            await service.showCompetition(request);
        emit(state.copyWith(competitions: result?.items));
        _isLoading = false;
      }

      if (event is SelectACompetitionEvent) {
        print('SelectACompetitionEvent is running ...');
        _isLoading = true;
        CompetitionDetailModel? competitionDetail =
            await service.loadDetailById(event.competitionId);
        emit(state.copyWith(
            competitionDetail: competitionDetail,
            //emit thêm competitionId Selected
            selectedCompetitionId: event.competitionId));
        _isLoading = false;
        print('_isLoading done: $_isLoading');
      }
    });
  }
}
