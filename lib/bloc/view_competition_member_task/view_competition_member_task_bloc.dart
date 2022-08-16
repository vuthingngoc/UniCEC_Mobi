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

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  ViewCompetitionMemberTaskBloc({required this.service})
      : super(ViewCompetitionMemberTaskState(
            listCompetition: [],
            searchName: null,
            isEvent: false,
            hasNext: false,
            currentPage: 1)) {
    on((event, emit) async {
      _isLoading = true;
      //init Event
      if (event is InitEvent) {
        //get clubIdSelected
        if (GetIt.I.get<CurrentUser>().clubIdSelected != 0) {
          //load
          PagingResult<CompetitionModel>? result =
              await service.loadCompetitionMemberTask(
                  state.currentPage, state.searchName, state.isEvent);
          //
          if (result != null) {
            //emit
            emit(state.copyWith(
                listCompetition: result.items,
                searchName: state.searchName,
                isEvent: state.isEvent,
                hasNext: result.hasNext,
                currentPage: result.currentPage));
          } else {
            //emit
            emit(state.copyWith(
                listCompetition: [],
                searchName: state.searchName,
                isEvent: state.isEvent,
                hasNext: false,
                currentPage: 1));
          }
        }
        _isLoading = false;
      }
      //Refesh Event
      if (event is RefreshEvent) {
        //refresh state
        emit(state.copyWith(
            listCompetition: [],
            searchName: state.searchName,
            isEvent: state.isEvent,
            hasNext: false,
            currentPage: 1));
      }
      //Increase Event
      if (event is IncrementalEvent) {
        int increase = state.currentPage + 1;
        emit(state.copyWith(
            listCompetition: state.listCompetition,
            searchName: state.searchName,
            isEvent: state.isEvent,
            hasNext: state.hasNext,
            currentPage: increase));
      }
      //Load More
      if (event is LoadAddMoreEvent) {
        //load
        PagingResult<CompetitionModel>? result =
            await service.loadCompetitionMemberTask(
                state.currentPage, state.searchName, state.isEvent);
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
            searchName: state.searchName,
            isEvent: state.isEvent,
            hasNext: result?.hasNext ??
                false, // result trả ra null thì đồng nghĩa với việc hasNext = false
            currentPage: result?.currentPage ?? state.currentPage));
      }
      if (event is ChangeSearchNameEvent) {
        emit(state.copyWith(
            listCompetition: state.listCompetition,
            searchName: event.searchName, // change
            isEvent: state.isEvent,
            hasNext: state.hasNext,
            currentPage: state.currentPage));
      }
      if (event is ChangeValueEvent) {
        //load
        PagingResult<CompetitionModel>? result = await service
            .loadCompetitionMemberTask(1, state.searchName, event.isEvent);

        emit(state.copyWith(
            listCompetition: result?.items ?? [],
            searchName: state.searchName,
            isEvent: event.isEvent, // change
            hasNext: result?.hasNext ?? false,
            currentPage: result?.currentPage ?? 1));
      }
      if (event is SearchEvent) {
        //get clubIdSelected
        if (GetIt.I.get<CurrentUser>().clubIdSelected != 0) {
          //load
          PagingResult<CompetitionModel>? result = await service
              .loadCompetitionMemberTask(1, state.searchName, state.isEvent);
          //

          //emit
          emit(state.copyWith(
              listCompetition: result?.items ?? [],
              searchName: state.searchName,
              isEvent: state.isEvent,
              hasNext: result?.hasNext ?? false,
              currentPage: result?.currentPage ?? 1));
        }
      }
      // if (event is ResetFilterEvent) {
      //   if (GetIt.I.get<CurrentUser>().clubIdSelected != 0) {
      //     //load
      //     PagingResult<CompetitionModel>? result =
      //         await service.loadCompetitionMemberTask(1, null, false);
      //     //emit
      //     emit(state.copyWith(
      //         listCompetition: result?.items ?? [],
      //         searchName: null,
      //         isEvent: false,
      //         hasNext: result?.hasNext ?? false,
      //         currentPage: result?.currentPage ?? 1));
      //   }
      // }
    });
  }
}
