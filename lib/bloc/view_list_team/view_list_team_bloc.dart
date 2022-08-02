import 'package:unicec_mobi/bloc/view_list_team/view_list_team_event.dart';
import '../../models/common/paging_result.dart';
import '../../models/entities/team/team_model.dart';
import '../../models/entities/team/team_request_model.dart';
import '../../services/i_services.dart';
import '../../utils/base_bloc.dart';
import 'view_list_team_state.dart';

class ViewListTeamBloc extends BaseBloc<ViewListTeamEvent, ViewListTeamState> {
  ITeamService service;

  ViewListTeamBloc({required this.service})
      : super(ViewListTeamState(
            listTeam: [], competitionId: 0, hasNext: false, currentPage: 1)) {
    on((event, emit) async {
      //Recieve Data
      if (event is RecieveDataEvent) {
        //------------Request
        TeamRequestModel request =
            TeamRequestModel(competitionId: event.competitionId);
        request.currentPage = state.currentPage;

        PagingResult<TeamModel>? result = await service.GetListTeam(request);

        if (request != null) {
          emit(state.copyWith(
              newListTeam: result?.items ?? [],
              newCompetitionId: event.competitionId,
              newHasNext: result?.hasNext ?? state.hasNext,
              newCurrentPage: result?.currentPage ?? state.currentPage));
        }
      }
      //Refesh Event
      if (event is RefreshEvent) {
        emit(state.copyWith(
            newListTeam: [],
            newCompetitionId: state.competitionId,
            newHasNext: false,
            newCurrentPage: 1));
      }
      //Increase Event
      if (event is IncrementalEvent) {
        int increase = state.currentPage + 1;
        emit(state.copyWith(
            newListTeam: state.listTeam,
            newCompetitionId: state.competitionId,
            newHasNext: state.hasNext,
            newCurrentPage: increase));
      }
      //LoadMore
      if (event is LoadAddMoreEvent) {
        //------------Request
        TeamRequestModel request =
            TeamRequestModel(competitionId: state.competitionId);
        request.currentPage = state.currentPage;

        PagingResult<TeamModel>? result = await service.GetListTeam(request);
        //
        List<TeamModel> listContinute = result?.items ?? [];
        //
        if (listContinute.isNotEmpty) {
          for (TeamModel team in listContinute) {
            state.listTeam.add(team);
          }
        }
        //
        emit(state.copyWith(
            newListTeam: state.listTeam,
            newCompetitionId: state.competitionId,
            newHasNext: result?.hasNext ??
                false, // result trả ra null thì đồng nghĩa với việc hasNext = false
            newCurrentPage: result?.currentPage ?? state.currentPage));
      }
    });
  }
}
