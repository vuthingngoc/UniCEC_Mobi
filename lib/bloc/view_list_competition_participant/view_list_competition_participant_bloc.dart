import '../../models/common/paging_result.dart';
import '../../models/entities/competition/competition_model.dart';
import '../../services/competition_svc/i_competition_service.dart';
import '/bloc/view_list_competition_participant/view_list_competition_participant_state.dart';
import '../../utils/base_bloc.dart';
import 'view_list_competition_participant_event.dart';

class ViewListCompetitionParticipantBloc extends BaseBloc<
    ViewListCompetitionParticipantEvent, ViewListCompetitionParticipantState> {
  ICompetitionService service;
  ViewListCompetitionParticipantBloc({required this.service})
      : super(ViewListCompetitionParticipantState(
            competitions: [],
            searchName: null,
            scope: null,
            hasNext: false,
            currentPage: 1)) {
    (on((event, emit) async {
      if (event is LoadListCompetitionParticipantEvent) {
        PagingResult<CompetitionModel>? result =
            await service.loadCompetitionParticipant(
                state.currentPage, state.scope, state.searchName);
        if (result != null) {
          emit(state.copyWith(
            newCompetitions: result.items,
            newScope: state.scope,
            newSearchName: state.searchName,
            newHasNext: result.hasNext,
            newCurrentPage: result.currentPage,
          ));
        }
      }
      //Refesh Event
      if (event is RefreshEvent) {
        emit(state.copyWith(
          newCompetitions: [],
          newScope: null,
          newSearchName: null,
          newHasNext: false,
          newCurrentPage: 1,
        ));
      }
      //Increase Event
      if (event is IncrementalEvent) {
        int increase = state.currentPage + 1;
        emit(state.copyWith(
            newCompetitions: state.competitions,
            newScope: state.scope,
            newSearchName: state.searchName,
            newHasNext: state.hasNext,
            newCurrentPage: increase));
      }
      //LoadMore
      if (event is LoadAddMoreEvent) {
        PagingResult<CompetitionModel>? result =
            await service.loadCompetitionParticipant(
                state.currentPage, state.scope, state.searchName);
        //
        List<CompetitionModel> listContinute = result?.items ?? [];
        //
        if (listContinute.isNotEmpty) {
          for (CompetitionModel competition in listContinute) {
            state.competitions.add(competition);
          }
        }
        //
        emit(state.copyWith(
          newCompetitions: state.competitions,
          newScope: state.scope,
          newSearchName: state.searchName,
          newHasNext: result?.hasNext ??
              false, // result trả ra null thì đồng nghĩa với việc hasNext = false
          newCurrentPage: result?.currentPage ?? state.currentPage,
        ));
      }
      //search event
      //dựa theo state search
      //mỗi lần search là current page = 1
      if (event is SearchEvent) {
        PagingResult<CompetitionModel>? result = await service
            .loadCompetitionParticipant(1, state.scope, state.searchName);
        if (result != null) {
          emit(state.copyWith(
            newCompetitions: result.items,
            newScope: state.scope,
            newSearchName: state.searchName,
            newHasNext: result.hasNext,
            newCurrentPage: result.currentPage,
          ));
        } else {
          emit(state.copyWith(
            newCompetitions: [],
            newScope: state.scope,
            newSearchName: state.searchName,
            newHasNext: false,
            newCurrentPage: 1,
          ));
        }
      }
      //
      if (event is ChangeSearchNameEvent) {
        emit(state.copyWith(
            newCompetitions: state.competitions,
            newSearchName: event.searchName,
            newScope: state.scope,
            newCurrentPage: state.currentPage,
            newHasNext: state.hasNext));
      }
      //
      if (event is ChangeCompetitionScopeEvent) {
        emit(state.copyWith(
            newCompetitions: state.competitions,
            newSearchName: state.searchName,
            newScope: event.scope,
            newCurrentPage: state.currentPage,
            newHasNext: state.hasNext));
      }
      //load lại trạng thái ban đầu
      if (event is ResetFilterEvent) {
        PagingResult<CompetitionModel>? result =
            await service.loadCompetitionParticipant(1, null, null);
        if (result != null) {
          emit(state.copyWith(
            newCompetitions: result.items,
            newScope: null,
            newSearchName: null,
            newHasNext: result.hasNext,
            newCurrentPage: result.currentPage,
          ));
        }
      }
    }));
  }
}
