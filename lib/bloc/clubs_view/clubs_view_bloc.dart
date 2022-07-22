import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/common/paging_result.dart';
import 'package:unicec_mobi/models/entities/member/member_detail_model.dart';
import 'package:unicec_mobi/services/club_svc/i_club_service.dart';
import '../../models/common/current_user.dart';
import '../../models/entities/club/club_model.dart';
import '../../utils/base_bloc.dart';
import 'clubs_view_event.dart';
import 'clubs_view_state.dart';

class ClubsViewBloc extends BaseBloc<ClubsViewEvent, ClubsViewState> {
  IClubService service;

  ClubsViewBloc({required this.service})
      : super(ClubsViewState(
            listClubsBelongToUniversity: [], hasNext: false, currentPage: 1)) {
    on((event, emit) async {
      if (event is ClubsViewInitEvent) {
        PagingResult<ClubModel> result =
            await service.getClubsBelongToUniversity(state.currentPage);

        List<ClubModel> listClubsUni = result.items;

        if (listClubsUni.isNotEmpty) {
          //load list member thuộc club đó có cả Status Pending, Active
          List<MemberDetailModel>? listMembersBelongToClubs =
              await service.getMembersBelongToClubs();

          if (listMembersBelongToClubs != null) {
            for (var memberOfClub in listMembersBelongToClubs) {
              for (var clubOfUni in listClubsUni) {
                if (memberOfClub.clubId == clubOfUni.id) {
                  clubOfUni.isMemberStatus = memberOfClub.status;
                }
              }
            }
          }

          emit(state.copyWith(
              listClubsBelongToUniversity: listClubsUni,
              hasNext: result.hasNext,
              currentPage: result.currentPage));
        } else {
          //thông báo lỗi load clubs
        }
      }
      //
      if (event is IncrementalEvent) {
        int increase = state.currentPage + 1;
        emit(state.copyWith(
            listClubsBelongToUniversity: state.listClubsBelongToUniversity,
            hasNext: state.hasNext,
            currentPage: increase));
      }
      //
      if (event is RefreshEvent) {
        //refresh state
        emit(state.copyWith(
            listClubsBelongToUniversity: [], hasNext: false, currentPage: 1));
      }

      // tự chạy hàm loading
      if (event is LoadAddMoreEvent) {
        PagingResult<ClubModel> result =
            await service.getClubsBelongToUniversity(state.currentPage);
        //
        List<ClubModel> listContinute = result.items;
        //
        if (listContinute.isNotEmpty) {
          //load list member thuộc club đó có cả Status Pending, Active
          List<MemberDetailModel>? listMembersBelongToClubs =
              await service.getMembersBelongToClubs();

          if (listMembersBelongToClubs != null) {
            for (var memberOfClub in listMembersBelongToClubs) {
              for (var clubOfUni in listContinute) {
                if (memberOfClub.clubId == clubOfUni.id) {
                  clubOfUni.isMemberStatus = memberOfClub.status;
                }
              }
            }
          }

          for (ClubModel club in listContinute) {
            state.listClubsBelongToUniversity.add(club);
          }
        }
        //
        emit(state.copyWith(
            listClubsBelongToUniversity: state.listClubsBelongToUniversity,
            hasNext: result.hasNext,
            currentPage: result.currentPage));
      }

      if (event is ChooseClubEvent) {
        listener.add(
            NavigatorClubViewDetailPageEvent(clubSelect: event.clubSelect));
      }
    });
  }
}
