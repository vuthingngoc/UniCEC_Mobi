import 'package:unicec_mobi/bloc/view_list_team_in_round/view_list_team_in_round_event.dart';
import 'package:unicec_mobi/bloc/view_list_team_in_round/view_list_team_in_round_state.dart';

import '../../models/common/paging_result.dart';
import '../../models/entities/team/team_in_round_model.dart';
import '../../models/entities/team/team_in_round_request_model.dart';
import '../../services/team_svc/i_team_service.dart';
import '../../utils/base_bloc.dart';

class ViewListTeamInRoundBloc
    extends BaseBloc<ViewListTeamInRoundEvent, ViewListTeamInRoundState> {
  ITeamService service;

  ViewListTeamInRoundBloc({required this.service})
      : super(ViewListTeamInRoundState(
            listTeamInRound: [],
            roundId: -1,
            hasNext: false,
            currentPage: 1,
            isLoading: true)) {
    on((event, emit) async {
      //InitEvent
      if (event is ViewListTeamInitEvent) {
        //------------Request
        TeamInRoundRequestModel request =
            TeamInRoundRequestModel(roundId: state.roundId);
        request.currentPage = state.currentPage;

        PagingResult<TeamInRoundModel>? result =
            await service.GetListTeamInRound(request);

        if (result != null) {
          emit(state.copyWith(
              newListTeamInRound: result.items,
              newRoundId: state.roundId,
              newHasNext: result.hasNext,
              newCurrentPage: result.currentPage,
              isLoading: false));
        }
      }
      //Recieve Data
      if (event is RecieveDataEvent) {
        //------------Request
        TeamInRoundRequestModel request =
            TeamInRoundRequestModel(roundId: event.roundId);
        request.currentPage = 1;
        PagingResult<TeamInRoundModel>? result =
            await service.GetListTeamInRound(request);

        if (result != null) {
          emit(state.copyWith(
              newListTeamInRound: result.items,
              newRoundId: event.roundId, //change
              newHasNext: result.hasNext,
              newCurrentPage: result.currentPage,
              isLoading: false));
        } else {
          emit(state.copyWith(
              newListTeamInRound: state.listTeamInRound,
              newRoundId: event.roundId, //change
              newHasNext: state.hasNext,
              newCurrentPage: state.currentPage,
              isLoading: false));
        }
      }
      //Refesh Event
      if (event is RefreshEvent) {
        emit(state.copyWith(
            newListTeamInRound: [],
            newRoundId: state.roundId,
            newHasNext: false,
            newCurrentPage: 1,
            isLoading: true));
      }
      //Increase Event
      if (event is IncrementalEvent) {
        int increase = state.currentPage + 1;
        emit(state.copyWith(
            newListTeamInRound: state.listTeamInRound,
            newRoundId: state.roundId,
            newHasNext: state.hasNext,
            newCurrentPage: increase,
            isLoading: false));
      }
      //LoadMore
      if (event is LoadAddMoreEvent) {
        //------------Request
        TeamInRoundRequestModel request =
            TeamInRoundRequestModel(roundId: state.roundId);
        request.currentPage = state.currentPage;

        PagingResult<TeamInRoundModel>? result =
            await service.GetListTeamInRound(request);
        //
        List<TeamInRoundModel> listContinute = result?.items ?? [];
        //
        if (listContinute.isNotEmpty) {
          for (TeamInRoundModel team in listContinute) {
            state.listTeamInRound.add(team);
          }
        }
        //
        emit(state.copyWith(
            newListTeamInRound: state.listTeamInRound,
            newRoundId: state.roundId,
            newHasNext: result?.hasNext ??
                false, // result trả ra null thì đồng nghĩa với việc hasNext = false
            newCurrentPage: result?.currentPage ?? state.currentPage,
            isLoading: false));
      }
      if (event is LoadingEvent) {
        emit(state.copyWith(
            newListTeamInRound: state.listTeamInRound,
            newRoundId: state.roundId,
            newHasNext: state.hasNext,
            newCurrentPage: state.currentPage,
            isLoading: true // change
            ));
      }
    });
  }
}
