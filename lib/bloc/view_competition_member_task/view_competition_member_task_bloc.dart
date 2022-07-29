import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/view_competition_member_task/view_competition_member_task_event.dart';
import 'package:unicec_mobi/bloc/view_competition_member_task/view_competition_member_task_state.dart';
import 'package:unicec_mobi/models/common/current_user.dart';

import 'package:unicec_mobi/models/common/paging_result.dart';

import '../../models/entities/competition/competition_model.dart';

import '../../services/competition_svc/i_competition_service.dart';
import '../../utils/base_bloc.dart';

class ViewCompetitionMemberTaskBloc extends BaseBloc<
    ViewCompetitionMemberTaskEvent, ViewCompetitionMemberTaskState> {
  final ICompetitionService service;

  ViewCompetitionMemberTaskBloc({required this.service})
      : super(ViewCompetitionMemberTaskState(
            listCompetition: [], hasNext: false, currentPage: 1)) {
    on((event, emit) async {
      //init Event
      if (event is InitEvent) {
        //get clubIdSelected
        if (GetIt.I.get<CurrentUser>().clubIdSelected != 0) {
          //load
          PagingResult<CompetitionModel>? result =
              await service.loadCompetitionMemberTask(state.currentPage);
          //
          if (result != null) {
            //emit
            emit(state.copyWith(
                listCompetition: result.items,
                hasNext: result.hasNext,
                currentPage: result.currentPage));
          }
        }
      }
      //Refesh Event
      if (event is RefreshEvent) {
        //refresh state
        emit(state
            .copyWith(listCompetition: [], hasNext: false, currentPage: 1));
      }
      //Increase Event
      if (event is IncrementalEvent) {
        int increase = state.currentPage + 1;
        emit(state.copyWith(
            listCompetition: state.listCompetition,
            hasNext: state.hasNext,
            currentPage: increase));
      }
      //Load More
      if (event is LoadAddMoreEvent) {
        //load
        PagingResult<CompetitionModel>? result =
            await service.loadCompetitionMemberTask(state.currentPage);
        //
        List<CompetitionModel> listContinute = result?.items ?? [];
        //
        if (listContinute.isNotEmpty) {
          for (CompetitionModel competition in listContinute) {
            state.listCompetition.add(competition);
          }
        }
        //
        emit(state.copyWith(
            listCompetition: state.listCompetition,
            hasNext: result?.hasNext ?? state.hasNext,
            currentPage: result?.currentPage ?? state.currentPage));
      }
    });
  }
}
