import 'package:get_it/get_it.dart';

import '../../models/common/current_user.dart';
import '../../models/entities/member/member_model.dart';
import '../../services/member_svc/i_member_service.dart';
import '../../utils/base_bloc.dart';
import 'view_list_member_event.dart';
import 'view_list_member_state.dart';

class ViewListMemberBloc
    extends BaseBloc<ViewListMemberEvent, ViewListMemberState> {
  IMemberService service;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading){
    _isLoading = isLoading;
  }

  ViewListMemberBloc({required this.service})
      : super(ViewListMemberState(
            listMember: [], searchName: null, clubRoleId: null)) {
    (on((event, emit) async {
      if (event is LoadListMemberEvent) {
        _isLoading = true;
        int clubIdSelected = GetIt.I.get<CurrentUser>().clubIdSelected;
        List<MemberModel>? result = await service.getListMemberByClub(
            clubIdSelected, state.searchName, state.clubRoleId);
        if (result != null) {
          emit(state.copyWith(
              newListMember: result,
              newSearchName: state.searchName,
              newClubRoleId: state.clubRoleId));
        } else {
          emit(state.copyWith(
              newListMember: [],
              newSearchName: state.searchName,
              newClubRoleId: state.clubRoleId));
        }
        _isLoading = false;
      }
      if (event is ChangeSearchNameEvent) {
        emit(state.copyWith(
            newListMember: state.listMember,
            newSearchName: event.searchName, // change
            newClubRoleId: state.clubRoleId));
      }
      if (event is ChangeClubRoleIdEvent) {
        int clubIdSelected = GetIt.I.get<CurrentUser>().clubIdSelected;
        List<MemberModel>? result = await service.getListMemberByClub(
            clubIdSelected, state.searchName, event.clubRoleId);

        emit(state.copyWith(
            newListMember: result ?? [],
            newSearchName: state.searchName,
            newClubRoleId: event.clubRoleId // change
            ));
      }
      if (event is SearchEvent) {
        int clubIdSelected = GetIt.I.get<CurrentUser>().clubIdSelected;
        List<MemberModel>? result = await service.getListMemberByClub(
            clubIdSelected, state.searchName, state.clubRoleId);
        if (result != null) {
          emit(state.copyWith(
              newListMember: result,
              newSearchName: state.searchName,
              newClubRoleId: state.clubRoleId));
        } else {
          emit(state.copyWith(
              newListMember: [],
              newSearchName: state.searchName,
              newClubRoleId: state.clubRoleId));
        }
      }
      if (event is ResetFilterEvent) {
        int clubIdSelected = GetIt.I.get<CurrentUser>().clubIdSelected;
        List<MemberModel>? result =
            await service.getListMemberByClub(clubIdSelected, null, null);
        if (result != null) {
          emit(state.copyWith(
              newListMember: result, newSearchName: null, newClubRoleId: null));
        } else {
          emit(state.copyWith(
              newListMember: [], newSearchName: null, newClubRoleId: null));
        }
      }
      if (event is ClickToViewInfoEvent) {
        listener.add(NavigatorToAccountPageEvent(userId: event.userId));
      }
    }));
  }
}
