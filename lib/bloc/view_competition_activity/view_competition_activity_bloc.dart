import 'package:unicec_mobi/bloc/view_competition_activity/view_competition_activity_state.dart';
import '../../models/common/paging_result.dart';
import '../../models/entities/competition_activity/competition_activity_model.dart';
import '../../models/entities/competition_activity/competition_activity_request_model.dart';
import '../../services/view_competition_activity_svc/i_view_competition_activity_service.dart';
import '../../utils/base_bloc.dart';
import '/bloc/view_competition_activity/view_competition_activity_event.dart';

class ViewCompetitionActivityBloc extends BaseBloc<ViewCompetitionActivityEvent,
    ViewCompetitionActivityState> {
  ICompetitionActivityService service;

  ViewCompetitionActivityBloc({required this.service})
      : super(ViewCompetitionActivityState(
            listCompetitionActivity: [],
            competitionId: 0,
            hasNext: false,
            currentPage: 1)) {
    on((event, emit) async {
      //Init Event
      if (event is ViewCompetitionActivityInitEvent) {
        //------------Request
        CompetitionActivityRequestModel request =
            CompetitionActivityRequestModel();
        request.competitionId = state.competitionId;
        request.currentPage = state.currentPage;

        PagingResult<CompetitionActivityModel>? result =
            await service.getListCompetititonActivity(request);

        if (request != null) {
          emit(state.copyWith(
              newListCompetitionActivity:
                  result?.items ?? state.listCompetitionActivity,
              newCompetitionId: state.competitionId,
              newHasNext: result?.hasNext ?? state.hasNext,
              newCurrentPage: result?.currentPage ?? state.currentPage));
        }
      }

      //Recieve Data Event
      if (event is RecieveDataEvent) {
        //------------Request
        CompetitionActivityRequestModel request =
            CompetitionActivityRequestModel();
        request.competitionId = event.competitionId;
        request.currentPage = state.currentPage;

        PagingResult<CompetitionActivityModel>? result =
            await service.getListCompetititonActivity(request);

        if (request != null) {
          emit(state.copyWith(
              newListCompetitionActivity:
                  result?.items ?? state.listCompetitionActivity,
              newCompetitionId: event.competitionId,
              newHasNext: result?.hasNext ?? state.hasNext,
              newCurrentPage: result?.currentPage ?? state.currentPage));
        }

        // emit(state.copyWith(
        //     newListCompetitionActivity: state.listCompetitionActivity,
        //     newCompetitionId: event.competitionId, //-> change
        //     newHasNext: state.hasNext,
        //     newCurrentPage: state.currentPage));
      }

      //Refesh Event
      if (event is RefreshEvent) {
        emit(state.copyWith(
            newListCompetitionActivity: [],
            newCompetitionId: state.competitionId,
            newHasNext: false,
            newCurrentPage: 1));
      }
      //Increase Event
      if (event is IncrementalEvent) {
        int increase = state.currentPage + 1;
        emit(state.copyWith(
            newListCompetitionActivity: state.listCompetitionActivity,
            newCompetitionId: state.competitionId,
            newHasNext: state.hasNext,
            newCurrentPage: increase));
      }
      //LoadMore
      if (event is LoadAddMoreEvent) {
        //------------Request
        CompetitionActivityRequestModel request =
            CompetitionActivityRequestModel();
        request.competitionId = state.competitionId;
        request.currentPage = state.currentPage;
        //load
        PagingResult<CompetitionActivityModel>? result =
            await service.getListCompetititonActivity(request);
        //
        List<CompetitionActivityModel> listContinute = result?.items ?? [];
        //
        if (listContinute.isNotEmpty) {
          for (CompetitionActivityModel competitionActivity in listContinute) {
            state.listCompetitionActivity.add(competitionActivity);
          }
        }
        //
        emit(state.copyWith(
            newListCompetitionActivity: state.listCompetitionActivity,
            newCompetitionId: state.competitionId,
            newHasNext: result?.hasNext ??
                false, // result trả ra null thì đồng nghĩa với việc hasNext = false
            newCurrentPage: result?.currentPage ?? state.currentPage));
      }
    });
  }
}
