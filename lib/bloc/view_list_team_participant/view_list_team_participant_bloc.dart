import 'package:unicec_mobi/bloc/view_list_team_participant/view_list_team_participant_event.dart';
import '../../models/common/paging_result.dart';
import '../../models/common/resultCRUD.dart';
import '../../models/entities/team/team_model.dart';
import '../../models/entities/team/team_request_model.dart';
import '../../services/i_services.dart';
import '../../utils/base_bloc.dart';
import 'view_list_team_participant_state.dart';

class ViewListTeamParticipantBloc extends BaseBloc<ViewListTeamParticipantEvent,
    ViewListTeamParticipantState> {
  ITeamService service;

  ViewListTeamParticipantBloc({required this.service})
      : super(ViewListTeamParticipantState(
            listTeam: [],
            competitionId: -1,
            hasNext: false,
            currentPage: 1,
            valueInvitedCode: '')) {
    on((event, emit) async {
      //InitEvent
      if (event is ViewListTeamInitEvent) {
        //------------Request
        TeamRequestModel request =
            TeamRequestModel(competitionId: state.competitionId);
        request.currentPage = state.currentPage;

        PagingResult<TeamModel>? result = await service.GetListTeam(request);

        if (result != null) {
          emit(state.copyWith(
              newListTeam: result.items,
              newCompetitionId: state.competitionId,
              newHasNext: result.hasNext,
              newCurrentPage: result.currentPage,
              valueInvitedCode: state.valueInvitedCode));
        }
      }
      //Recieve Data
      if (event is RecieveDataEvent) {
        //------------Request
        TeamRequestModel request =
            TeamRequestModel(competitionId: event.competitionId);
        request.currentPage = state.currentPage;

        PagingResult<TeamModel>? result = await service.GetListTeam(request);

        if (result != null) {
          emit(state.copyWith(
              newListTeam: result.items,
              newCompetitionId: event.competitionId, //change
              newHasNext: result.hasNext,
              newCurrentPage: result.currentPage,
              valueInvitedCode: state.valueInvitedCode));
        } else {
          emit(state.copyWith(
              newListTeam: state.listTeam,
              newCompetitionId: event.competitionId, //change
              newHasNext: state.hasNext,
              newCurrentPage: state.currentPage,
              valueInvitedCode: state.valueInvitedCode));
        }
      }
      //Refesh Event
      if (event is RefreshEvent) {
        emit(state.copyWith(
            newListTeam: [],
            newCompetitionId: state.competitionId,
            newHasNext: false,
            newCurrentPage: 1,
            valueInvitedCode: ''));
      }
      //Increase Event
      if (event is IncrementalEvent) {
        int increase = state.currentPage + 1;
        emit(state.copyWith(
            newListTeam: state.listTeam,
            newCompetitionId: state.competitionId,
            newHasNext: state.hasNext,
            newCurrentPage: increase,
            valueInvitedCode: state.valueInvitedCode));
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
            newCurrentPage: result?.currentPage ?? state.currentPage,
            valueInvitedCode: state.valueInvitedCode));
      }

      //get invited code
      if (event is ChangeInvitedCodeValueEvent) {
        emit(state.copyWith(
                newListTeam: state.listTeam,
                newCompetitionId: state.competitionId,
                newHasNext: state.hasNext,
                newCurrentPage: state.currentPage,
                valueInvitedCode: event.newInvitedCodeValue) // change
            );
      }

      //create team
      if (event is CreateTeamEvent) {
        ResultCRUD check = await service.CreateTeam(
            state.competitionId, event.teamName, event.teamDescription);
        if (check.check) {
          listener.add(RebuildListViewTeamEvent());
        } else {
          listener.add(ShowingSnackBarEvent(message: check.errorMessage));
        }
      }

      //join team
      if (event is JoinTeamEvent) {
        ResultCRUD check = await service.JoinTeam(state.valueInvitedCode);
        if (check.returnIntData > 0) {
          TeamModel? team = null;
          for (TeamModel model in state.listTeam) {
            if (model.id == check.returnIntData) {
              team = model;
            }
          }
          if (team != null) {
            listener.add(NavigatorTeamDetailPageEvent(
                teamId: check.returnIntData,
                competitionId: state.competitionId,
                teamName: team.name,
                teamDescription: team.description,
                status: team.status));
          }
        } else {
          listener.add(ShowingSnackBarEvent(message: check.errorMessage));
        }
      }
    });
  }
}
